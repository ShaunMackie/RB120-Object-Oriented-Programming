=begin

#Problem

- using the code from the previous exercise, add a setter method named 'name' and rename kitty to 'Luna' and invoke
greet again

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

  def name=(name)
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
kitty.name = 'Luna'
puts kitty.greeting