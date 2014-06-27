
class Person

  def initialize(name, sex, age)
    @name = name
    @sex = sex
    @age = age

    @marital_status = :single
  end

  def name
    @name
  end

  def name=(val)
    @name = val
  end

  def age
    @age
  end

  def age=(val)
    @age = val
  end

  def sex
    @sex
  end

  def sex=(val)
    @sex = val
  end

  def introduce_yourself
    puts "Hello, my name is #{@name}, I am a #{@age} years old #{@sex}"
  end
end

vasya = Person.new("Vasya", :male, 40)

vasya.introduce_yourself

puts vasya.name
#puts vasya.age
#puts vasya.sex
#puts vasya.marital_status

vasya.name = "Vassily"
puts "Now known as " + vasya.name

