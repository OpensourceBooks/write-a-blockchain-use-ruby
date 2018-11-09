require "xmlrpc/client"
require "pp"

host = ARGV[0]
port = ARGV[1]
cmd = ARGV[2]
param = ARGV[3]

# Make an object to represent the XML-RPC server.
server = XMLRPC::Client.new2( "http://#{host}:#{port}")

# Call the remote server and get our result
if param
    pp server.call("block.#{cmd}","#{param}")
else
    pp server.call("block.#{cmd}")
end


