=begin

#Problem

- using the below-given code, create a module named Walkable that contains a method called walk.
- this method should print 'Let's go for a walk!' when invoked. Include Walkable in Cat and invoke walk on kitty

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 


# Implementation Notes 


=end

module Walkable
  def walk
    "Let's go for a walk!"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
endS

kitty = Cat.new('Sophie')
kitty.greet
kitty.walk