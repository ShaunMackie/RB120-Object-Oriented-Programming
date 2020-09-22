# =begin

# #Problem

# - add the appropriate accessor methods to the code below.
# - keep in mind that 'last_name' getter shouldn't be visible outside the class
#   while the first name getter should be visible outside of the class

# #Input

# #Output

# #Examples

# # Rules + Questions

# #Algorithm 

# # Implementation Notes 

# =end

class Person
  attr_accessor :first_name
  attr_writer :last_name

  def first_equals_last?
    first_name == last_name
  end

  private

  attr_reader :last_name
end

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'
puts person1.first_equals_last?

