require "sqlite3"
# conn
def c
    SQLite3::Database.new "./db/blockchain"
end