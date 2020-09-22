=begin

#Problem

- modify the below-given code to accept a string containing a first and last name
- the name should be split into two instance variables in the setter method, 
  then joined in hte getter method to form a full name

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

# Implementation Notes 

=end

class Person
  def name
    @first_name + " " + @last_name
  end

  def name=(name)
    @name = name.split
    @first_name = @name.first
    @last_name = @name.last
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name