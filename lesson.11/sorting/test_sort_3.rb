#!/usr/bin/env ruby

load 'data'

#idx = 1 # english
idx = 2 # german

sorted = @trn_numbers.sort {|a,b|
    a[idx] <=> b[idx]
}

puts sorted.inspect

