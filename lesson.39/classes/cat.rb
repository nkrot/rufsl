
class Cat
  attr_accessor :name, :age

  def initialize name, age
    @name = name
    self.age = age # or: @age = age

#    puts "#{@name}/#{@age}"
  end
end
