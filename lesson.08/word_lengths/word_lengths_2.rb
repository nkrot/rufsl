#!/usr/bin/env ruby

MAX = 10
stats = []

while word = gets
  word.chomp!

  next  if word.empty?

  len = word.length

  stats [len] ||= [0]
  stats [len][0] += 1

  if stats[len][0] <= MAX
    stats [len] << word
  end
end

stats.each_with_index {|data, len|
  if data
    puts "#{len} #{data.join(", ")}"
  end
}
