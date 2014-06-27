
class Person

  attr_accessor :name
  attr_reader   :sex, :age, :marital_status
  attr_reader   :children

  def initialize(name, sex, age)
    @name = name
    self.sex = sex
    self.age = age
    # incorrect!
#    sex = sex
#    age = age
    # works but is not reliable
#    @sex = sex
#    @age = age

    @valid_marital_statuses = %w{single married divorced widow widower}
    self.marital_status = "single"

    @children = []
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

  def greet other
    if other.age <= 15
      puts "Hi, little #{other.name}"
    else
      title = other.sex == 'male' ? "Mister" : "Miss"
      puts "Hello, #{title} #{other.name}"
    end
  end

  def add_child p
    if p.age + 13 >= age
      raise "Can not add #{p.name}/#{p.age} yrs old as a child of #{name}/#{age} yrs old"
    else
      @children << p
    end
  end

  # use it instead of 
  # attr_reader :children
#  def children
#    @children.dup
#  end

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

if $0 == __FILE__

  john = Person.new("John", :male,   30)
  mary = Person.new("Mary", :female, 14)

  john.greet mary
  mary.greet john

  puts "John has #{john.children.count} children"

  john.add_child Person.new("Anna", "female", 3)
  puts "John has #{john.children.count} child(ren)"

  # will throw an error
  if !true
    john.add_child Person.new("Thor", "male", 100)
    puts "John has #{john.children.count} child(ren)"
  end

  # modifying @children directly
  if !true
    john.children << Person.new("Thor", "male", 100)
    puts "John has #{john.children.count} child(ren)"
  end
end

