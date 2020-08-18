=begin

#Problem

- using the below-given code, add two methods: generic_greeting and personal_greeting
- the first method should be a class method and print a greeting that's generic to the class
- the second method should be an instance method and print a greeting that's custom to the object

#Input

#Output

#Examples

# Rules + Questions

- the generic_greeting method is a class method
- the personal_greeting method is an instance method

#Algorithm 

# Implementation Notes 

=end

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def personal_greeting
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting