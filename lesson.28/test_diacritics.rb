#!/usr/bin/ruby
# -*- coding: iso-8859-1 -*-

Encoding::default_internal = 'Windows-1252'

if "s�duisant" =~ /^[a-z����������������]*$/i
  puts "French - it works for lower case"
end

if "�tienne" =~ /^[a-z����������������]*$/i
  puts "French - it works for upper case"
end

if "�berraschung" =~ /^[a-z����]*$/i
  puts "German - it works for lower case"
end

if "�sterreich" =~ /^[a-z����]*$/i
  puts "German - it works for upper case"
end
