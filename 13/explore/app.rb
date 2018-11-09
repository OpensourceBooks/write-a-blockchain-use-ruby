require 'sinatra'
require "xmlrpc/client"

host = ARGV[0]
port = ARGV[1]

server = XMLRPC::Client.new2( "http://#{host}:#{port}")

set :bind, '0.0.0.0'
set :port, 3000
set :root, File.dirname(__FILE__)
set :public_folder, Proc.new { File.join(root, "static") }
set :views, Proc.new { File.join(root, "view") }
get '/' do
    @title = "blockchain"
    @blocks = server.call("block.all")
    erb :index
end