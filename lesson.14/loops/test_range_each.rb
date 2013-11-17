#!/usr/bin/env ruby

puts "In direct order"
(3..7).each {|i| puts i}

puts "In reverse order"
(3..7).reverse_each {|i| puts i}

puts "In reverse order (method 2). does not work"
(7..3).each {|i| puts i}
