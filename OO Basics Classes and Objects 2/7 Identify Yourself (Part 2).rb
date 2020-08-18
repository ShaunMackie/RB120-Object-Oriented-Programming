=begin

#Problem

- update the code so that it prints "I'm Sophie! when it invokes puts kitty"

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

# Implementation Notes 

=end

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty
