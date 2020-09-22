=begin

#Problem

- add the appropriate accessor methods so that @name is returned with the added prefix 'Mr.'

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

# Implementation Notes 

=end

class Person
  attr_writer :name

  def name
    'Mr. ' + @name
  end
end

person1 = Person.new
person1.name = 'James'
puts person1.name

