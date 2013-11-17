#!/usr/bin/env ruby

load 'data'

puts @numbers.sort {|a,b|
    a.length <=> b.length
}.inspect

