=begin

#Problem

- Modify the folllowing code so that the value of @phone_number can't be modified outside the class

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

# Implementation Notes 

=end

class Person
  attr_reader :phone_number

  def initialize(number)
    @phone_number = number
  end

  private
  attr_writer :phone_number
end

person1 = Person.new(1234567899)
puts person1.phone_number

person1.phone_number = 9987654321
puts person1.phone_number