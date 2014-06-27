
class Person

  attr_accessor :name, :sex, :age
  attr_accessor :marital_status

  def initialize(name, sex, age)
    @name = name
    @sex = sex
    @age = age

    @marital_status = "single"
  end

  def introduce_yourself
    puts "Hello, my name is #{@name}, I am a #{@age} years old #{@sex}"
  end

#  def age=(val)
#    if invalid_age
#      raise "Invalid value: #{val}"
#    end
#  end
end

vasya = Person.new("Vasya", :male, 40)

vasya.introduce_yourself

puts vasya.name
#puts vasya.age
#puts vasya.sex
puts vasya.name + "'s marital status is " + vasya.marital_status

vasya.name = "Vassily"
puts "Now known as " + vasya.name

