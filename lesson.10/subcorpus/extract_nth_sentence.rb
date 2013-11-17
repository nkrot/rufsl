#!/usr/bin/ruby

# # #
# USAGE: extract_nth_sentence.rb corpus.tok.txt
#

nth = 10 # extract each nth sentence

c_in = 0 # keeps track of the current line number

while line = gets
  line.chomp!

  unless line.empty?
    c_in += 1

    if c_in == nth
      puts line
      c_in = 0
    end
  end
  
end
