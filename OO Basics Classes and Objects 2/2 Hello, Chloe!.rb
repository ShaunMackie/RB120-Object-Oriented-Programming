=begin

#Problem

- using the below-given code, add an instance method named rename that renames kitty when invoked

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

  def rename(new_name)
    @name = new_name
  end
end

kitty = Cat.new('Sophie')
p kitty.name
kitty.rename('Chloe')
p kitty.name