=begin

#Problem

- using the code from the previous exercise, replace the getter and setter methods using Ruby shorthand

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 


# Implementation Notes 


=end

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greeting
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty.greeting
puts kitty.name
kitty.name = 'Luna'
puts kitty.greeting