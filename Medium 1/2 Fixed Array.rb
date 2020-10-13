=begin

#Problem

- a fixed-length array is an array that always has a fixed number of elements
- write a class that implements a fixed-length array
- and provides the neccessary methods to support the below-given code

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

- create a program that takes an integer as an argument and returns an array 
- the length of the given integer argument made up of 'nil's

# Implementation Notes 

=end

class FixedArray
  attr_reader :array

  def initialize(integer)
    @array = [nil] * integer
  end

  def [](num)
    array[num]
  end

  def []=(num, object)
    array[num] = object
  end

  def to_a
    self.array
  end

  def to_s
    to_a.to_s
  end
    
end


fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end