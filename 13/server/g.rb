
require "json"
require "pp"
require "./lib/c.rb"
require "./lib/h.rb"
require "./lib/b.rb"

if __FILE__ == $0
    p = ARGV[0]
    if p == nil
        p = "cr4fun"
    end
    b = B.new
    b.build
    b.init(p)
    pp b.all
end