=begin

#Problem

- using the code from the previous exercise, move the greeting from the initialize method to an instance
method named greet that prints a greeting when invoked

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 


# Implementation Notes 

- create a method called 'greeting'
- move the 2nd line of the 'initialize' method to the greeting method
- invoke the method

=end

class Cat
  def initialize(name)
    @name = name
  end

  def greeting
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty.greeting