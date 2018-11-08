require "json"
require "pp"
require "./lib/conn.rb"
require "./lib/hash.rb"
require "./lib/b.rb"

if __FILE__ == $0
    a = ARGV[0]
    p = ARGV[1]

    b = B.new

    if a == "build"
        pp b.build
    end

    if a == "init" and p
        pp b.init(p)
    end

    if a == "g" or a == "first"
        pp b.first
    end

    if a == "last"
        pp b.last
    end

    if a == "all"
        pp b.all
    end

    if a == "add"
        if p == nil
            puts "get help"
        else
            b.add(p)
        end
    end

    # 高度
    if a == "h"
        pp b.h
    end

    # 验证
    if a == "v"
        pp b.v
    end

    if a == nil or a == "-help" or a == "-h"
        puts "help"
    end
end