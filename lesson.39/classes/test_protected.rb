
class Person
  attr_accessor :name

  protected

  def jump
    # Person <name> is jumping
    puts "#{self.class} #{self.name} is jumping"
  end
end

class Student < Person
  def jump_together_with(obj)
    # Student <name> is jumping
    puts "#{self.class} #{self.name} is jumping with"
    obj.jump
  end
end

susan = Person.new
susan.name = "Susan"

#susan.jump #=> error

student = Student.new
student.name = "Alex"

student.jump_together_with susan


