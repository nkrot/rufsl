#!/usr/bin/env ruby

load 'data'

res = @numbers.map {|item|
    str = item * 2
    str.upcase
}

puts res.to_s

puts @numbers.to_s



