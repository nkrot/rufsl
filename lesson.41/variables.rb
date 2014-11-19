#!/usr/bin/env ruby

class Person
  # class variable is shared among all instances of the class
  @@total = 0 # total population

  #def Person.total # can write like this as well
  def self.total
    @@total
  end

  attr_accessor :name

  def initialize name
    @name = name  # object variable

    @@total += 1  # increase total population
  end
end


puts "World population " + Person.total.to_s

alice = Person.new "Alice"

puts "World population " + Person.total.to_s

folks = [ Person.new("Bob"), Person.new("Carol") ]

puts "World population " + Person.total.to_s

