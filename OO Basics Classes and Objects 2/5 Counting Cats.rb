=begin

#Problem

- using the below-given code, create a Cat class that tracks the number of times a new Cat object is instantiated
- the total number of cat instances should be printed when total is invoked

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

# Implementation Notes 

- create a Cat class
- create a class method that trakcs the total
- create a class method called total to display the total
- create an initialize variable that increments the class variable by 1 each time a new object is instantiated

=end

class Cat
  @@total = 0

  def initialize
    @@total += 1
  end

  def self.total
    @@total
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total