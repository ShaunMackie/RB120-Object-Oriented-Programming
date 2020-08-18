=begin

#Problem

- using the code from the previous exercise, add a parameter to the initialize method that provides
a name for each new Cat object.
- use an instance variable to print a greeting with the provided name.

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 


# Implementation Notes 

- add a 'name' parameter to the initialize method
- have it print 'Hello! My name is #{name}!'

=end

class Cat
  def initialize(name)
    @name = name
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')