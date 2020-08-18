=begin

#Problem

- modify the given code so that 'Hello! I am a cat!' is printed when Cat.generic_greeting is invoked

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

# Implementation Notes 

=end

class Cat
  def self.generic_greeting
    puts "Hello! I am a cat!"
  end
end

Cat.generic_greeting
kitty = Cat.new
kitty = kitty.class
p kitty #kitty has been reassigned to the class of kitty, which is Cat