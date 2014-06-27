
class Person

  def initialize(name, sex, age)
    @name = name
    @sex = sex
    @age = age
  end

  def introduce_yourself
    puts "Hello, my name is #{@name}, I am a #{@age} years old #{@sex}"
  end
end

vasya = Person.new("Vasya", :male, 40)

vasya.introduce_yourself

# TODO: uncomment me
#puts vasya.age

lady_in_red = Person.new("Susan", :female, 25)
lady_in_red.introduce_yourself
