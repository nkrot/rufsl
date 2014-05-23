#!/usr/bin/env ruby

def mergesort! (array)
  array.replace mergesort(array)
end

def mergesort(array)
  return array if array.size <= 1
  mid = array.size / 2
#  puts mid.inspect
  left  = array[0, mid]
  right = array[mid, array.size] # krot: array.size works but it is incorrect. read ri Array#[]
  merge(mergesort(left), mergesort(right))
end

def merge(left, right)
  sorted = []
  until left.empty? or right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted.concat(left).concat(right)
end

de = [7,2,0,6,9,0]

puts mergesort(de).inspect
