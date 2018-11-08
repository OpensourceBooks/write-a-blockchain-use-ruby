require "sqlite3"
def conn
    db_file = "./db/blockchain"
    SQLite3::Database.new db_file
end