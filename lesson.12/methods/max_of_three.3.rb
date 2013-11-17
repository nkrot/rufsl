#!/usr/bin/env ruby

def max_of_three(*args)
  return args.max
end

puts max_of_three(1, 100, 2, 500_000)

# kinda unit testing of methods :)
puts max_of_three(1, 100, 2) == 100
puts max_of_three(1, 100, 2, 500_000) == 500000
