require "json"
require "pp"
require "./lib/c.rb"
require "./lib/h.rb"
require "./lib/b.rb"
require 'xmlrpc/server'
s = XMLRPC::Server.new(1212)
class Handler
    # 为了安全，rpc不可以重置、不可以创世。
    # def build
    #     B.new.build
    # end
    # def init(data)
    #     B.new.init(data)
    # end
    def g
        B.new.first
    end
    def add(data)
        B.new.add(data)
        last
    end
    def first
        g
    end
    def last
        B.new.last
    end
    def all
        B.new.all
    end
    # 高度 index
    def i
        B.new.i
    end
    def v
        B.new.v
    end
end
s.add_handler("block", Handler.new) 
trap("INT") { s.shutdown } 
s.serve