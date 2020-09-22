=begin

#Problem

- create a module called Towable that contains a method named tow that prints "I can tow a trailer!"
- include the module in the Truck class

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

# Implementation Notes 

=end

module Towable
  def tow
    puts "I can tow a trailer!"
  end
end

class Truck
  include Towable
end

class Car
end

truck1 = Truck.new
truck1.tow