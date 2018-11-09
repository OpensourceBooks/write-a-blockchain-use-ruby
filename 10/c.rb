require "xmlrpc/client"
require "pp"

# Make an object to represent the XML-RPC server.
server = XMLRPC::Client.new2( "http://localhost:1212")

# Call the remote server and get our result
pp server.call("block.build")
pp server.call("block.init","hi~")
server.call("block.add","tom")
server.call("block.add","jerry")
server.call("block.add","cr4fun")
pp server.call("block.last")
pp server.call("block.all")
# 验证
pp server.call("block.v")