require "digest"
require "json"
require "pp"

@blockchain = []

def block(index,data,pre_hash)
    timestamp = Time.now.to_i
    {
        "index" => index,
        "timestamp" => timestamp,
        "data" => data,
        "pre_hash" => pre_hash,
        "hash" => hash(index,timestamp,data,pre_hash)
    }
end

def hash(index,timestamp,data,pre_hash)
    sha = Digest::SHA256.new
    sha.update( index.to_s + timestamp.to_s + data + pre_hash )
    sha.hexdigest
end

def last
    @blockchain.last
end

def g(text)
    @blockchain << block(0,text,"0")
end

def add(data)
    index,pre_hash = last["index"],last["hash"]
    @blockchain << block(index+1,"hello",pre_hash)
end

def v(blockchain)
    
    pre_hash = "0"
    blockchain.each do |block|
        pp block["pre_hash"]==pre_hash
    end
    
end
g("hi")

add("tom")
add("green")

# pp @blockchain
v(@blockchain)