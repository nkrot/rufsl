
class Person

  attr_accessor :name
  attr_reader   :sex, :age, :marital_status

  def initialize(name, sex, age)
    @name = name
    self.sex = sex
    self.age = age

    @valid_marital_statuses = %w{single married divorced widow widower}
    self.marital_status = "single"
  end

  def introduce_yourself
    puts "Hello, my name is #{@name}, I am a #{@age} years old #{@sex}"
  end

  def age=(v)
    validate_age(v)
    @age = v
  end

  def sex=(v)
    validate_sex(v)
    @sex = v.to_s
  end

  def marital_status=(v)
    validate_marital_status(v)
    @marital_status = v
  end

  ########
  private
  # all methods defined below will be private
  ########

  def validate_marital_status(val)
    unless @valid_marital_statuses.include?(val)
      raise "Invalid value: #{val}"
    end
  end

  def validate_sex(val)
    unless ["male", "female"].include?(val.to_s)
      raise "Invalid value: #{val}"
    end
  end

  def validate_age(val)
    unless val.between?(0, 120)
      raise "Invalid value: #{val}"
    end
  end


  # also correct
#  private :validate_sex, :validate_age
#  private :validate_marital_status
end

######################################################################

vasya = Person.new("Vasya", :male, 40)
#vasya = Person.new("Vasya", :male, 140)

vasya.introduce_yourself

puts vasya.name + "'s marital status is " + vasya.marital_status

# TODO: some combinations of age/marital_status are impossible
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

#vasya.validate_age(10) #=> error. private method called


