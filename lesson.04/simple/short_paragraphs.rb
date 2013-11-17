#!/usr/bin/env ruby
# -*- coding: windows-1252; -*-

# # #
# Given a text, print lines containing less that 10 tokens
#

Encoding::default_external = "Windows-1252"

c_out = c_in = 0
while line = gets
  line.chomp!

  if line.empty?
    # we just skip empty lines
  else
    c_in += 1 # all non-empty lines
    if line.split.length < 10
      puts line
      c_out += 1
    end
  end
end

STDERR.puts "Lines in/out: #{c_in}/#{c_out}"

