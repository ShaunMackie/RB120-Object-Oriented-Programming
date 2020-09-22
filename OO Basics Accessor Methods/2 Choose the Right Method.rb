=begin

#Problem

- add the appropriate accessor methods to the following code

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

# Implementation Notes 

=end


class Person
  attr_writer :name, :phone_number
  attr_reader :name

  # def name
  #   @name
  # end

  # def name=(name)
  #   @name = name
  # end

  # def phone_number=(phone_number)
  #   @phone_number = phone_number
  # end
end

person1 = Person.new
person1.name = 'Jessica'
person1.phone_number = '0123456789'
puts person1.name
