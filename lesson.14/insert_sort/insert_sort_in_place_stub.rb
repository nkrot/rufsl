#!/usr/bin/env ruby

# TODO: place your code here
def ...
end

# tests, you can add more
[[9,7,9,1,5,-3],
 [],
 [1,2,3,4,5],
 [1,2,3,4,5,4,2,3,1,0],
 [9,8,7,6,5,4,3,2,1,0]
].each do |numbers|
  sorted_numbers = numbers.sort
  insert_sort(numbers)
  puts numbers == sorted_numbers
end
