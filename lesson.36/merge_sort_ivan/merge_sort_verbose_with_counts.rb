#!/usr/bin/env ruby

@debug = true

def verboser msg, level=0
  if @debug
    puts "   " * level + msg
  end
end

@c_calls = 0
def mergesort(array, level=-1)
  @c_calls += 1
  level += 1
  verboser "[in mergesort] Initial array: #{array.inspect}", level

  if array.size <= 1
    verboser "[in mergesort] Base case reached: #{array.inspect} is sorted! Returning", level
    return array
  end

#  mid = array.size / 2
  mid = array.size*2 / 3

  left  = array[0...mid]
  right = array[mid...array.size]

  verboser "[in mergesort] Split as: #{left.inspect} and #{right.inspect}", level

  sorted_left  = mergesort(left, level)
  sorted_right = mergesort(right, level)

  merged = merge(sorted_left, sorted_right, level)

  verboser "[in mergesort] Returning merged: #{merged.inspect}", level
  return merged
end

def merge(left, right, level=0)
  verboser "[in merge] Merging arrays: #{left.inspect} and #{right.inspect}", level
  sorted = []
  until left.empty? or right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted.concat(left).concat(right)

  verboser "[in merge] Merged into: #{sorted.inspect}. Returning", level
  return sorted
end

de = [7,2,0,6,9,0]

puts mergesort(de).inspect

puts "The method merge_sort was called #{@c_calls} times"
