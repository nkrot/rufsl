#!/usr/bin/env ruby

load 'data'

res = @numbers.map {|item|
    [item, item.upcase]
}

puts res.inspect




