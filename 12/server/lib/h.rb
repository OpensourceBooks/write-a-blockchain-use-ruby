require "digest"
# hash
def h(index,timestamp,data,pre_hash)
    sha = Digest::SHA256.new
    sha.update( "#{index}#{timestamp}#{data}#{pre_hash}" )
    sha.hexdigest
end