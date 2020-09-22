=begin

#Problem

- add the appropriate accessor methods so that @name is capitalized upon assignment

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

# Implementation Notes 

=end

class Person
  def name=(name)
    @name = name.capitalize
  end

  def name
    @name
  end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name

