#!/usr/bin/env ruby

load 'data'

puts @fruits.sort {|a,b|
    b <=> a
}.inspect

