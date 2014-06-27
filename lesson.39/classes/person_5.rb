
class Person

  attr_accessor :name
  attr_reader   :sex, :age, :marital_status

  def initialize(name, sex, age)
    @name = name
    self.sex = sex
#    @age = age
    self.age = age

    @valid_marital_statuses = %w{single married divorced widow widower}
    self.marital_status = "single"
  end

  def age=(v)
    if v.between?(0, 120)
      @age = v
    else
      raise "Invalid value: #{v}"
    end
  end

  def introduce_yourself
    puts "Hello, my name is #{@name}, I am a #{@age} years old #{@sex}"
  end

  def sex=(v)
    if ["male", "female"].include?(v.to_s)
      @sex = v.to_s
    else
      raise "Invalid value: #{v}"
    end
  end
 
  def marital_status=(v)
    if @valid_marital_statuses.include?(v)
      @marital_status = v
    else
      raise "Invalid value: #{v}"
    end
  end
end

######################################################################

vasya = Person.new("Vasya", :male, 40)
#vasya = Person.new("Vasya", :male, 140)

vasya.introduce_yourself

puts vasya.name + "'s marital status is " + vasya.marital_status

vasya.name = "Vassily"
vasya.age = 10
vasya.marital_status = "divorced"
vasya.sex = :female

vasya.introduce_yourself

## all the following should raise an error
#vasya.age = -10
#vasya.age = 130
#vasya.marital_status = "disappointed"
#vasya.sex = "camel"

