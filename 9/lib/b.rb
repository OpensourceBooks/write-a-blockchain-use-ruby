class B
    # build
    def build
        if !File.directory?"db"
            Dir.mkdir("db")
        end
        sql = "CREATE TABLE `block` (
            `index`	INTEGER NOT NULL,
            `timestamp`	INTEGER NOT NULL,
            `data`	TEXT NOT NULL,
            `pre_hash`	TEXT NOT NULL,
            `hash`	TEXT NOT NULL,
            PRIMARY KEY(`index`)
        );"
        conn.execute( sql )
        "build ok"
    end
    # 清空并创世
    def init(data)
        conn.execute( "delete from block" )
        index = 0
        timestamp = Time.now.to_i
        pre_hash = 0
        hash = hash(index,timestamp,data,pre_hash)
        sql = "INSERT INTO `block`(`index`,`timestamp`,`data`,`pre_hash`,`hash`) VALUES (#{index},#{timestamp},'#{data}','#{pre_hash}','#{hash}');"
        conn.execute( sql )
        {
            :index => index,
            :timestamp => timestamp,
            :data => data,
            :pre_hash => pre_hash,
            :hash => hash
        }
    end

    def add(data)
        # last = Blockchain.new.last
        lastindex,pre_hash = last[:index],last[:hash]
        index = lastindex + 1
        timestamp = Time.now.to_i
        hash = hash(index,timestamp,data,pre_hash)
        sql = "INSERT INTO `block`(`index`,`timestamp`,`data`,`pre_hash`,`hash`) VALUES (#{index},#{timestamp},'#{data}','#{pre_hash}','#{hash}');"
        conn.execute( sql ) 
    end

    def all
        sql = "select * from block"
        @blockchain = []
        conn.execute( sql ) do |row|
            index = row[0]
            timestamp = row[1]
            data = row[2]
            pre_hash = row[3]
            hash = row[4]
            block = {
                :index => index,
                :timestamp => timestamp,
                :data => data,
                :pre_hash => pre_hash,
                :hash => hash
            }
            @blockchain << block
        end
        @blockchain
    end

    def last
        sql = "select * from block order by `index` desc limit 1"
        conn.execute( sql ) do |row|
            index = row[0]
            timestamp = row[1]
            data = row[2]
            pre_hash = row[3]
            hash = row[4]
            @last = {
                :index => index,
                :timestamp => timestamp,
                :data => data,
                :pre_hash => pre_hash,
                :hash => hash
            }
        end
        @last
    end

    # 获得创世区块
    def first
        sql = "select * from block where `index`=0"
        conn.execute( sql ) do |row|
            index = row[0]
            timestamp = row[1]
            data = row[2]
            pre_hash = row[3]
            hash = row[4]
            @g = {
                :index => index,
                :timestamp => timestamp,
                :data => data,
                :pre_hash => pre_hash,
                :hash => hash
            }
        end
        @g 
    end

    # 获得区块链高度
    def h
        last[:index]
    end

    #验证
    def v
        @flag = true
        blockchain = all
        @first = true
        blockchain.each do |block|

            # 对比本区块的内容是不是和区块的hash值一致。即使一致，也可能会发生伪造。所以还要对比上一次。
            if hash(block[:index],block[:timestamp],block[:data],block[:pre_hash]) != block[:hash]
                @flag = false 
            end

            # 以下是对比上一次 的hash
            if @first
                # 从创世区块后开始对比 pre_hash 
                @first = false
                @last_hash = hash(block[:index],block[:timestamp],block[:data],block[:pre_hash])
            else 
                # 如果上一个hash不等于本次记录的上一条hash
                if @last_hash != block[:pre_hash]
                    @flag = false 
                    pp "last err"
                end
                @last_hash = hash(block[:index],block[:timestamp],block[:data],block[:pre_hash])
            end
        end
        @flag
    end
end