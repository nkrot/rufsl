#!/usr/bin/ruby

things = %w[ 1 uno 234 dos ]
things.map! do |el|
  if el =~ /^\d+$/
    el.to_i
  else
    el.upcase
  end
#  "HELLO"
end

puts things.inspect




