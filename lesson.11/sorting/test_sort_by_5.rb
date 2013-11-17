#!/usr/bin/env ruby

load 'data'

#idx = 1 # english
idx = 2 # german

sorted = @trn_numbers.sort_by {|a|
    a[idx]
}

puts sorted.inspect

