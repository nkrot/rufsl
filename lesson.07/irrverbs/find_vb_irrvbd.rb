#!/usr/bin/env ruby

# # #
#
#

require 'optparse'

OptionParser.new do |opts|
  opts.banner = "
  List VB that have irregular VBD forms in prosao1 dictionary.
USAGE: DicTester --all | #{File.basename($0)} [OPTIONS]
OPTIONS:
"
  opts.on('-h', '--help', 'display this message and exit') do
    puts opts
    exit 0
  end

  opts.separator " "
end.parse!

######################################################################

Encoding::default_internal = "Windows-1252"
Encoding::default_external = "Windows-1252"

c_vb = 0
c_reg_vbd = 0
c_irr_vbd = 0

while line = gets
  line.chomp!

  if line =~ /classes/
    vb = nil
  end

  if line =~ /VB-/ && line =~ /^(.*[^\s])\s+classes:/
    vb = $1	  # or vb = line.split(/  +/).first
    c_vb += 1
  end

  if line =~ /VB-.+--> VBD-\d+ (.+)/ && vb
    vbd = $1.strip

    if vbd =~ /ED$/ && vb != vbd
      # regular VBD
      c_reg_vbd += 1
    else
      puts "%s\tVB\t-->\tVBD\t%s" % [vb, vbd]
      c_irr_vbd += 1
    end
  end
end

puts "Verbs (VB) in dictionary: #{c_vb}"
puts "Regular/irregular VBD: #{c_reg_vbd}/#{c_irr_vbd}"

