#!/usr/bin/env ruby

load 'data'

@numbers.sort_by! {|item|
    item.delete('ieaou')
}

puts @numbers.inspect

