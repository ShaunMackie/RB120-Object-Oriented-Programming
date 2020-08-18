=begin

#Problem

- using the below-given code, add an instance method named compare_secret that compares
the value of @secret from person1 with person2

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

# Implementation Notes 

=end

class Person
  attr_writer :secret

  def compare_secret(person)
    @secret == person.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)