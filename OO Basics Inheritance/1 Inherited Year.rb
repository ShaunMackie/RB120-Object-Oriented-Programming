=begin

#Problem

- using the below-given code, create two classes - Truck and Car - that both inherit from Vehicle

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

# Implementation Notes 

=end

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle

end

class Car < Vehicle

end

truck1 = Truck.new(1994)
puts truck1.year

car1 = Car.new(2006)
puts car1.year