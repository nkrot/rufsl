#!/usr/bin/env ruby

module Syn
  def untag
    gsub(/_[^_\s]+\b/, "")
  end
end

class String
  include Syn
end

# doesnot work
#puts Syn.untag("apples_NNS kill_VB")

puts "apples_NNS kill_VB".untag

# same as
#"apples_NNS kill_VB".gsub(/_[^_\s]+\b/, "")

