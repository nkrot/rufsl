#! /usr/bin/env ruby

def mergesort! (array)
  array.replace mergesort(array)
end

def mergesort(array)
  return array if array.size <= 1
  mid = array.size / 2
#  puts mid.inspect
  left  = array[0, mid]
  right = array[mid, array.size] # krot. this works but is not correct. see ri Array#[]
  merge(mergesort(left), mergesort(right))
end


def merge(left,right)
  
  res = []
  
  lind = rind = 0
  
  while lind < left.size && rind < right.size 
    if left[lind] <= right[rind]
      res << left[lind]
      lind +=1 
    else
      res << right[rind]
      rind +=1
    end
  end
  res + left[lind..-1] + right[rind..-1]
end


de = [7,2,0,6,9,0]

puts mergesort(de)


#numbers = [1,3,5,2,3,4,4,5,6,7]
# mergesort([mergesort(numbers), 2,4, 5,7])
