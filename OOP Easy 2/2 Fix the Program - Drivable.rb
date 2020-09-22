=begin

#Problem

- correct the below-given program so that it works properly. 
- assume that the car class has a complete implementation
- just make the smallest possible change to ensure that cars have access to the drive method

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

# Implementation Notes 

=end

module Drivable
  def drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive