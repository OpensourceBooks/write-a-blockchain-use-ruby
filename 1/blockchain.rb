require "digest"
require "json"
require "pp"

blockchain = []

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

blockchain << block(0,"g","0")
pp blockchain