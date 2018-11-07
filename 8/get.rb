require "digest"
require "json"
require "pp"
require "sqlite3"

db_file = "./blockchain"
@db = SQLite3::Database.new db_file

def blockchain
    @blockchain = []
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
        @blockchain << block
    end
    @blockchain
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

def g()
    sql = "select * from block where `index`=0"
    @db.execute( sql ) do |row|
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




if __FILE__ == $0
    @p = ARGV[0]
    if @p == nil
        @p = "all"
    end

    if @p == "all"
        pp blockchain
    end

    if @p == "last"
        pp last
    end

    if @p == "g"
        pp g
    end
end