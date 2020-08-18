=begin

#Problem

- using the code from the previous exercise, add a getter method named 'name' and invoke it in place of
@name in greet

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 


# Implementation Notes 


=end

class Cat
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def greeting
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty.greeting
puts kitty.name