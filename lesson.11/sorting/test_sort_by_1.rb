#!/usr/bin/env ruby

load 'data'

@numbers.sort_by! {|item|
    item.length
}

puts @numbers.inspect

