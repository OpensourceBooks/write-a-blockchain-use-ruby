require "json"
require "pp"
require "xmlrpc/client"
require 'sinatra'
require 'json'

port = ARGV[0]
set :bind, '0.0.0.0'
set :port, port
set :root, File.dirname(__FILE__)

rpc_host = ARGV[1]
rpc_port = ARGV[2]
# set :public_folder, Proc.new { File.join(root, "static") }
# set :views, Proc.new { File.join(root, "view") }
server = XMLRPC::Client.new2( "http://#{rpc_host}:#{rpc_port}")

before do
    headers \
        "Content-type" => "application/json"
end


get '/g' do
    JSON server.call("block.first")
end

get '/add/:data' do
    data = params["data"]
    server.call("block.add","#{data}")
    JSON server.call("block.last")
end

get '/first' do
    JSON server.call("block.first")
end

get '/last' do
    JSON server.call("block.last")
end

get '/all' do
    JSON server.call("block.all")
end

# 高度 index
get '/i' do
    JSON server.call("block.i")
end

get '/v' do
    JSON server.call("block.v")
end