#!/usr/bin/env ruby

class Person
  include Comparable

  attr_accessor :name, :age

  def initialize name, age
    @name = name  # object variable
    @age = age
  end

  def <=> other
    @age <=> other.age
  end

  alias older_than >
end


alice = Person.new "Alice", 10
bob   = Person.new "Bob",   11
carol = Person.new "Carol", 10

if alice > bob
  puts "Alice is older than Bob"
elsif alice == bob
  puts "Alice and Bob are the same age"
else
  puts "Alice is younger than Bob"
end

puts "Method #older_than"
puts "Is Bob older than Alice? "  + bob.older_than(alice).to_s

# Task: uncomment these lines and make the code runnable
#puts "Is Carol is younger than Alice? " + carol.younger_than(alice).to_s
#puts "Is Carol is younger than Bob? "   + carol.younger_than(bob).to_s
