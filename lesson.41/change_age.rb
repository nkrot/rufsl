#!/usr/bin/env ruby

class Person
  attr_accessor :name
  attr_reader :age

  def initialize name, age
    @name = name  # object variable
    @age = age
  end
end

alice = Person.new "Alice", 25

puts "#{alice.name} is #{alice.age} years old" 

puts "Now let's try to fake Alice age :)"
alice.age = 10
puts "#{alice.name} is now #{alice.age} years old" 
