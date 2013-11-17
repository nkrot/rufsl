#!/usr/bin/env ruby

# # #
# USAGE: DicTester --all | find_jj_with_jjr.rb
#

Encoding::default_internal = "Windows-1252"
Encoding::default_external = "Windows-1252"

word_jj = nil

while line = gets

  if line =~ /\sclasses:/
    word_jj = nil
  end

  if line =~ /^([^\s]+)\s+classes:.+JJ-/
    word_jj = $1
  end

  if line =~ /--> JJR-/ && word_jj
    puts word_jj
  end
end

