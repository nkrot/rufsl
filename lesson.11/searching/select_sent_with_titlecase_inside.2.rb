#!/usr/bin/ruby

while line = gets
  words = line.split
  words.shift
  if words.any? {|word| word =~ /[[:upper:]]/}
    puts line
  end
end
