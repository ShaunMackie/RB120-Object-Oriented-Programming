=begin

#Problem

- multiply @age by 2 upon assignment
- then multiply @age by 2 again when @age is returned by the getter method

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

# Implementation Notes 

=end

class Person
  def age=(age)
    @age = age * 2
  end

  def age
    @age * 2
  end
end

person1 = Person.new
person1.age = 20
puts person1.age