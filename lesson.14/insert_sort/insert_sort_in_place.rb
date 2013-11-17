#!/usr/bin/env ruby

@debug = !false

def insert_sort(arr)
  puts "Unsorted: #{arr.inspect}"  if @debug
  arr.each_with_index do |el, i|
    puts "Current[##{i}]=#{el}"  if @debug
    (i-1).downto(0) do |j|
      if el < arr[j]
        puts "Moving #{arr[j]} to the right" if @debug
        arr[j+1] = arr[j]
      else
        j = j+1
        break  # breaks out of downto
      end
      arr[j] = el
      puts "Inserted #{el} at #{j}: #{arr.inspect}" if @debug
    end
  end
end

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

