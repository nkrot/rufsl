#!/usr/bin/ruby

load 'data'

sorted = @numerals.sort {|a, b|
  a[1].last <=> b[1].last
}

puts sorted.inspect
