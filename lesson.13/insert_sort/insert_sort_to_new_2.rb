#!/usr/bin/env ruby

def insert_sort(arr)
  sorted = []
  arr.each {|el| insert_sorted(sorted, el) }
#  puts sorted.inspect
  sorted
end

def insert_sorted(sorted, new_el)
  i = sorted.index {|el| new_el <= el} #|| sorted.length
  if i
    sorted.insert(i, new_el)
  else 
    sorted << new_el
  end
#  sorted.insert(i, new_el)
#  puts sorted.inspect
end

numbers = [9,7,9,1,5,-3]
puts insert_sort(numbers) == numbers.sort

numbers = []
puts insert_sort(numbers) == numbers.sort

numbers = [1,2,3,4,5]
#puts "Initial #{numbers.inspect}"
puts insert_sort(numbers) == numbers.sort

numbers = [1,2,3,4,5,4,2,3,1,0]
#puts "Initial #{numbers.inspect}"
puts insert_sort(numbers) == numbers.sort
