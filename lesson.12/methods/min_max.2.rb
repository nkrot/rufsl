#!/usr/bin/ruby

values = [3,2,5,9,1,-7]

def min_max(vals)
    return vals.min, vals.max
end

both_values = min_max(values)

puts both_values.class
puts "min = #{both_values[0]}"
puts "max = #{both_values[1]}"
