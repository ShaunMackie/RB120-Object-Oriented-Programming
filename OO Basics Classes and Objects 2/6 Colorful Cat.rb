=begin

#Problem

- create a class named Cat that prints a greeting when 'greet' is invoked
- the greeting should include the name and the color of the cat
- use a constant to define the color

#Input

#Output

#Examples

# Rules + Questions

- use a constant to define the color

#Algorithm 

# Implementation Notes 
- initialize a Cat class
- initialize a constant called color and assign it the value of the string object purple
- init an initialize method that takes one parameter, name
- init an instance method that outputs the greeting

=end

# class Cat
#   attr_accessor :name
#   COLOR = 'purple'

#   def initialize(name)
#     self.name = name
#   end

#   def greet
#     puts "Hello! My name is #{name} and I'm a #{COLOR} cat!"
#   end
# end

class Cat
  COLOR = 'purple'

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{@name} and I'm a #{COLOR} cat!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet

