#!/usr/bin/ruby

values = [3,2,5,9,1,-7]

def min_max(vals)
    return vals.min, vals.max
end

min, max = min_max(values)


puts "min = #{min}"
puts "max = #{max}"
