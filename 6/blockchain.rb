require "digest"
require "json"
require "pp"
require "sqlite3"

db_file = "./blockchain"
@db = SQLite3::Database.new db_file

def getblockchain
    blockchain = []
    sql = "select * from block"
    @db.execute( sql ) do |row|
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
        blockchain << block
    end
    blockchain
end

def block(index,data,pre_hash)
    timestamp = Time.now.to_i
    {
        :index => index,
        :timestamp => timestamp,
        :data => data,
        :pre_hash => pre_hash,
        :hash => hash(index,timestamp,data,pre_hash)
    }
end

def hash(index,timestamp,data,pre_hash)
    sha = Digest::SHA256.new
    sha.update( "#{index}#{timestamp}#{data}#{pre_hash}" )
    sha.hexdigest
end

def last
    sql = "select * from block order by `index` desc limit 1"
    @db.execute( sql ) do |row|
        index = row[0]
        timestamp = row[1]
        data = row[2]
        pre_hash = row[3]
        hash = row[4]
        @block = {
            :index => index,
            :timestamp => timestamp,
            :data => data,
            :pre_hash => pre_hash,
            :hash => hash
        }
    end
    @block
end

# 创世区块
def g(data)
    index = 0
    timestamp = Time.now.to_i
    pre_hash = 0
    hash = hash(index,timestamp,data,pre_hash)
    sql = "INSERT INTO `block`(`index`,`timestamp`,`data`,`pre_hash`,`hash`) VALUES (#{index},#{timestamp},'#{data}','#{pre_hash}','#{hash}');"
    @db.execute( sql ) 
end

def add(data)
    lastindex,pre_hash = last[:index],last[:hash]
    index = lastindex + 1
    timestamp = Time.now.to_i
    hash = hash(index,timestamp,data,pre_hash)
    sql = "INSERT INTO `block`(`index`,`timestamp`,`data`,`pre_hash`,`hash`) VALUES (#{index},#{timestamp},'#{data}','#{pre_hash}','#{hash}');"
    @db.execute( sql ) 
end

# 验证
def v(blockchain)
    flag = true
    pre_hash = "0"
    blockchain.each do |block|
        if block["pre_hash"] != pre_hash
            return false
        end
        pre_hash = block["hash"]
    end
    flag
end

g("hi")

add("tom")
add("jerry")
pp last

pp getblockchain
pp v(getblockchain)