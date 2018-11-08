require "xmlrpc/client"
require "pp"

# Make an object to represent the XML-RPC server.
server = XMLRPC::Client.new2( "http://localhost:1212")

# Call the remote server and get our result
pp server.call("blockchain.get","all")