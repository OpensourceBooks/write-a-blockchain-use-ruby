require "digest"
require "json"
require "pp"
require "sqlite3"

db_file = "./blockchain"
@db = SQLite3::Database.new db_file


def hash(index,timestamp,data,pre_hash)
    sha = Digest::SHA256.new
    sha.update( "#{index}#{timestamp}#{data}#{pre_hash}" )
    sha.hexdigest
end


# 创世区块
def g(data)
    index = 0
    timestamp = Time.now.to_i
    pre_hash = 0
    hash = hash(index,timestamp,data,pre_hash)
    sql = "INSERT INTO `block`(`index`,`timestamp`,`data`,`pre_hash`,`hash`) VALUES (#{index},#{timestamp},'#{data}','#{pre_hash}','#{hash}');"
    @db.execute( sql )
    {
        :index => index,
        :timestamp => timestamp,
        :data => data,
        :pre_hash => pre_hash,
        :hash => hash
    }
end


pp g(ARGV[0])