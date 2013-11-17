#!/usr/bin/env ruby

# # #
# USAGE: DicTester --all | find_jj_no_jjr.rb
#

Encoding::default_internal = "Windows-1252"
Encoding::default_external = "Windows-1252"

word_jj = nil

while line = gets
  line.chomp!

  # when starting to ptocess a new entry,
  # reset variables that accumulate state information
  if line =~ /\sclasses:/
    word_jj = nil
    has_jjr = false
  end

  # ensure the current word has JJ tag
  if line =~ /^([^\s]+)\s+classes:.+JJ-/
    word_jj = $1
  end

  # ensure the current word has JJ-to-JJR conversion
  if line =~ /JJ-.+ --> JJR-/
    has_jjr = true
  end

  # we have eached the end of entry. now we can make decisions
  # about the entry we have just been processing.
  if line.empty? && word_jj && !has_jjr
    puts word_jj
  end
end

