#!/usr/bin/env ruby

# # #
# this will work for at most two VBDs
#

Encoding::default_internal = "Windows-1252"
Encoding::default_external = "Windows-1252"

while line = gets
  line.chomp!

  if line =~ /classes:/
    vb = vbd1 = nil
  end

  if line =~ /^(.+\S)\s+classes:.+VB-/
    vb = $1
  end

  if vb && line =~ /VB-.+--> VBD-\d+ (.+)/
    if vbd1
      # we've seen the 2nd VBD
      puts "#{vb}\tVB\t-->\tVBD\t#{vbd1}\t#{line.split.last}"
    else
      # we've seen the 1st VBD
      vbd1 = line.split.last
    end
  end
end
