=begin

#Problem

- with the below-given code, modify the start-engine method in the Truck class by appending "Drive fast, please!"
to the return value of the start_engine method in Vehicle class
- the 'fast' in 'Drive fast, please!' should be the value of the speed variable

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

# Implementation Notes 

=end

class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    super() + " Drive #{speed}, please!"
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')