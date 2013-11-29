#!/usr/bin/env ruby

def palindrome? word
  word.reverse == word
end

def volvogram? word
  @volvograms.key? word.reverse
end

@volvograms = {}

while line = gets
  line.chomp!

  if line.length < 2
    # ignore

  elsif palindrome? line
    puts "palindrome\t#{line}"

  elsif volvogram? line
    puts "volvogram\t#{line}"
  end

  @volvograms [line] = nil
end
