=begin

#Problem

- The following code is flawed. It currently allows @name to be modified from outside of the method via a destructive method call.
- fix the code so that it returns a copy of @name instead of a reference to it


#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

# Implementation Notes 

=end

class Person
  def name
    @name.dup
  end

  def initialize(name)
    @name = name
  end
end

person1 = Person.new('James')
person1.name.reverse!
puts person1.name