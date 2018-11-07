require "sqlite3"
def getconn
    db_file = "blockchain.db"
    db = SQLite3::Database.new db_file
end