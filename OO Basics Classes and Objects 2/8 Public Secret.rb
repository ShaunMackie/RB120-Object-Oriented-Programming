=begin

#Problem

- using the below-given code, create a class named Person with an instance variable named @secret
- use a setter method to add a value to secret
- use a getter method to print @secret

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

# Implementation Notes 

- create a Person class
- create a setter method
- create a getter method

=end

class Person
  attr_accessor :secret
  # def secret=(phrase)
  #   @secret = phrase
  # end

  # def secret
  #   @secret
  # end
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret