class B
    # build
    def build
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
end