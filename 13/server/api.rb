require "json"
require "pp"
require "./lib/c.rb"
require "./lib/h.rb"
require "./lib/b.rb"
require 'sinatra'
require 'json'

port = ARGV[0]
set :bind, '0.0.0.0'
set :port, port
set :root, File.dirname(__FILE__)
# set :public_folder, Proc.new { File.join(root, "static") }
# set :views, Proc.new { File.join(root, "view") }

before do
    headers \
        "Content-type" => "application/json"
end


get '/g' do
    JSON B.new.first
end

get '/add/:data' do
    data = params["data"]
    B.new.add(data)
    JSON B.new.last
end

get '/first' do
    JSON B.new.first
end

get '/last' do
    JSON B.new.last
end

get '/all' do
    
    JSON B.new.all
end

# 高度 index
get '/i' do
    JSON B.new.i
end

get '/v' do
    JSON B.new.v
end