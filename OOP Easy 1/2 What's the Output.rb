=begin

#Problem

- fix this class so that there are no surprises waiting in store for the unsuspecting developer

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

# Implementation Notes 
- this question is more vague than I'm used to
- I believe we are intended to make it so that the value of the @name instance variable is not mutated?
- also I believe that the constuctor method is incorrect and should just be @name = name


=end

class Pet
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

fluffy = Pet.new('Fluffy')
puts fluffy.name
puts fluffy
puts fluffy.name
