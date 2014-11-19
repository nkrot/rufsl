#!/usr/bin/env ruby

class Person
  attr_accessor :name

  def initialize name, age
    @name = name  # object variable
    @age = age
  end

end


alice = Person.new "Alice", 10
bob   = Person.new "Bob", 11

puts "Alice older than Bob? " + alice.older_than(bob).to_s
puts "Bob older than Alice? "  + bob.older_than(alice).to_s

