#!/usr/bin/env ruby

require './syn' # specifying relative path is a hack

["apples_NNS kill_VB", "Antanarivo_NP"].each do |str|
  puts str.inspect
  puts Syn.untag(str).inspect
#  puts Syn.tags(str).inspect
#  puts Syn.words(str).inspect
  puts ""
end
