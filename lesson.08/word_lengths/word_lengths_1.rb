#!/usr/bin/env ruby

stats = []

while word = gets
  word.chomp!

  if word.empty?
    next
  end

  stats [word.length] ||= 0
  stats [word.length] += 1
end

#puts stats.inspect

stats.each_with_index {|count, len|
  if count
    puts "#{count} words of length #{len}"
  end
}
