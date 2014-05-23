#! /usr/bin/env ruby

def mergesort! (array)
  array.replace mergesort(array)
end

def mergesort(array)
  return array if array.size <= 1
  mid = array.size / 2
#  puts mid.inspect
  left  = array[0, mid]
  right = array[mid, array.size] # krot: array.size is incorrect though it works. read ri Array#[]
  merge(mergesort(left), mergesort(right))
end


def merge(left,right)

...

end


de = [7,2,0,6,9,0]

puts mergesort(de).inspect


