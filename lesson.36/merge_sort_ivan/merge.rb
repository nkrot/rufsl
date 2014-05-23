#! /usr/bin/env ruby

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

# testcases

puts merge([1,4,9,10], [1,2,3,4,5,11]) == [1,1,2,3,4,4,5,9,10,11]


puts merge([2,2,9], [0,4,4,7,10,14]) == [0,2,2,4,4,7,9,10,14]


puts merge([1], []) == [1]
