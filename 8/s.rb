require 'xmlrpc/server'
require './get.rb'

s = XMLRPC::Server.new(1212)
class MyHandler
    def get(p)
        @b=[]
        if @p == nil
            @p = "all"
        end
    
        if @p == "all"
            @b = blockchain
        end
    
        if @p == "last"
            @b = last
        end
    
        if @p == "g"
            @b = g
        end
        @b
    end 
end

s.add_handler("blockchain", MyHandler.new) 
trap("INT") { s.shutdown } 
s.serve