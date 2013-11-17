#!/usr/bin/ruby

# Task from Yuliya
#
# Assume s is a string of lower case characters.
#
# Write a program that prints the longest substring of s in which the letters occur in alphabetical order. For example, if s = 'azcbobobegghakl', then your program should print
#
# Longest substring in alphabetical order is: beggh
# In the case of ties, print the first substring. For example, if s = 'abcbcd', then your program should print
#
# Longest substring in alphabetical order is: abc

######################################################################

def find_longest_sorted_substring(str)
  results = []

  0.upto(str.length-1).each do |i|
    results << longest_head_substring(str[i..-1])
  end

  results.sort_by {|el| el.length}.last
end

######################################################################

def longest_head_substring(str)
  chars = str.split('')

  res = chars[0]
  1.upto(chars.length-1) do |n|
    p = n-1 # previous
    if chars[p] <= chars[n]
      res << chars[n]
    else
      break
    end
  end
  
  res
end

######################################################################

tests = \
[
 [ 'azcbobobegghakl', 'beggh' ],
 [ 'abcbcd', 'abc' ]
]

tests.each do |input, et_result|
  ac_result = find_longest_sorted_substring(input)

  if et_result == ac_result
    puts "OK\t\"#{ac_result}\""
  else
    puts "BAD\t\"#{ac_result}\" does not match expected \"#{et_result}\""
  end
end
