#!/usr/bin/ruby

load 'data'

sorted = @eng_numerals.sort_by {|k, v|
  k.to_i
}

puts sorted.inspect


