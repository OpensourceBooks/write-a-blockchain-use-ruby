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

def last
    sql = "select * from block order by `index` desc limit 1"
    @db.execute( sql ) do |row|
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

def add(data)
    lastindex,pre_hash = last[:index],last[:hash]
    index = lastindex + 1
    timestamp = Time.now.to_i
    hash = hash(index,timestamp,data,pre_hash)
    sql = "INSERT INTO `block`(`index`,`timestamp`,`data`,`pre_hash`,`hash`) VALUES (#{index},#{timestamp},'#{data}','#{pre_hash}','#{hash}');"
    @db.execute( sql ) 
end

if __FILE__ == $0
    @d = ARGV[0]
    if @d == nil
        @d = "hi~"
    end
    add(@d)
    pp last
end