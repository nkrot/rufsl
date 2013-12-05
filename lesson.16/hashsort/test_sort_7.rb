#!/usr/bin/ruby

load 'data'

class Hash
  def sort_by_value
    self.sort_by {|k,v| v}
  end
end

puts "Original data"
puts @eng_numerals.inspect


puts "Data sorted by hash value"
puts @eng_numerals.sort_by_value.inspect


if @eng_numerals.respond_to?(:sort_by_value)
  puts "Yes, Hash now has the method sort_by_value"
end

#puts @eng_numerals.methods.sort.inspect
