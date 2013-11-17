#!/usr/bin/env ruby

def strjoin(*args, sep)
  args.join(sep)
end

puts strjoin("aa", "bb", "cc", "\t")

#def strjoin2(*args, sep=',')
#  args.join(sep)
#end
