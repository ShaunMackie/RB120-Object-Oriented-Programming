=begin

#Problem

- add the appropriate accessor methods to the following code

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

# Implementation Notes 

=end


class Person
  attr_accessor :name

  # def name
  #   @name
  # end

  # def name=(name)
  #   @name = name
  # end
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name