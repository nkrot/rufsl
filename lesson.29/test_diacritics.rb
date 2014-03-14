#!/usr/bin/ruby
# -*- coding: iso-8859-1 -*-

Encoding::default_internal = 'Windows-1252'

if "séduisant" =~ /^[a-zàâçéèêëîïôûùüÿñæœ]*$/i
  puts "French - it works for lower case"
end

if "Étienne" =~ /^[a-zàâçéèêëîïôûùüÿñæœ]*$/i
  puts "French - it works for upper case"
end

if "überraschung" =~ /^[a-zßäöü]*$/i
  puts "German - it works for lower case"
end

if "Österreich" =~ /^[a-zßäöü]*$/i
  puts "German - it works for upper case"
end
