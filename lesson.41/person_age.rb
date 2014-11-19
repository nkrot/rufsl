#!/usr/bin/env ruby

class Person
  # class variable is shared among all instances of the class
  @@total = 0 # total population

  #def Person.total # can write like this as well
  def self.total
    @@total
  end

  attr_accessor :name, :age

  def initialize name, age
    @name = name  # object variable
    @age = age

    @@total += 1  # increase total population
  end

  def older_than other
    @age > other.age
  end
end


alice = Person.new "Alice", 10
bob   = Person.new "Bob", 11

puts "Alice older than Bob? " + alice.older_than(bob).to_s
puts "Bob older than Alice? "  + bob.older_than(alice).to_s

