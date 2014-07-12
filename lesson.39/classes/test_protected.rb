#!/usr/bin/ruby

class Person
  attr_accessor :name

  def make_jump other
    puts "#{self.class} #{self.name} tries to make #{other.name} jump"
    other.jump
  end

  protected

  def jump
    # Person <name> is jumping
    puts "#{self.class} #{self.name} is jumping"
  end
end

class Child < Person
  def jump_together_with(obj)
    # Student <name> is jumping
    puts "#{self.class} #{self.name} is jumping with"
    obj.jump
  end
end

susan = Person.new
susan.name = "Susan"

puts "\nTEST 1: No one can call protected method"
begin
  susan.jump #=> error
rescue Exception => e
  puts "An exception was raised when tryin to call protected method Person#jump"
  puts e.message
  puts e.backtrace.inspect
end

# another Person can make Person jump
puts "\nTEST 2: Another object of the same class can call protected method"
bob = Person.new
bob.name = "Bob"

bob.make_jump susan

puts "\nTEST 3: A subclass object can call a protected method of the superclass"
alex_boy = Child.new
alex_boy.name = "Alex"

alex_boy.jump_together_with susan


