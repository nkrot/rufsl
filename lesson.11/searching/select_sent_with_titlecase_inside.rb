#!/usr/bin/ruby

while line = gets
  if line.split[1..-1].any? {|word| word =~ /[[:upper:]]/}
    puts line
  end
end
