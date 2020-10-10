=begin

#Problem
- a circular queue is a collection of objects stored in a buffer that is treated as though it is connected end-to-end in a circle
- when an ojbect is added, it is added to the position immediately following the most recently added object. 
  - for this program, I believe that would mean it would be added to the slot beside the highest existing number
- removing an object always removes the object that's been in the queue the longest...in this case it will be the lowest number
- this works as long as there is at least one empty slot
- if the buffer is full, adding a new object means we must remove the oldest object and replace it with the new object
  - again, I believe we'd remove the lowest number and add the new number


  we need to create a class called CircularQueue that implements a circular queue for arbitrary objects
  the class should obtain the buffer size with an argument provided to a new CQ object and provide the following methods:

  - enqueue - adds an object
  - dequeue - removes the oldest object and returns it 

- we can use nil to represent empty spaces in the queue
- none of the values passed in to the queue will be nil - that's why we can use nil to represent empty spaces in the queue

#Input

- an integer, which represents the number of slots the circular queue should have

#Output

- when we call the dequeue method, it should return the object that was removed from the queue

#Examples

# Rules + Questions

#Algorithm 


# Implementation Notes
 
- we need a CircularQueue class
- we need a constructor method that takes one argument, which is the number of slots in the queue
  - the constructor should initialize a queue with the proper amount of slots
    - this will be an array of nils
  -we need an enqueue instance method that takes an argument representing the number that needs to be inserted into the queue
    - this will iterate though the array and look for the largest number
      - if it doesn't find a number, it slots it into the first spot
      - if it finds a number, and finds a nil it slots in the argument passed to it to the next available nil spot
      - if it finds a number but doesn't find a nil, it looks for the lowest number, removes it, and replaces it with the argument
  -we need a dequeue instance method
    - this will iterate through the array looking for the lowest number
      - if it finds a number, it removes it and replaces it with nil and returns the number
      - if it doesn't find a number, it returns nil
=end

class CircularQueue
  attr_reader :circular_queue

  def initialize(number)
    @circular_queue = [nil] * number
  end

  def enqueue(integer)
    copy = circular_queue.dup
    copy.delete(nil)
    highest_number = copy.max
    if circular_queue.all?(nil) || circular_queue.count(nil) > 0
      circular_queue[circular_queue.index(nil)] = integer
    elsif circular_queue.include?(nil) == false
      circular_queue[circular_queue.index(circular_queue.min)] = integer
    elsif circular_queue.max == circular_queue.last
      circular_queue[0] == integer
    else circular_queue[circular_queue.index(highest_number) + 1] = integer
    end
  end

  def dequeue
    copy = circular_queue.dup

    return nil if circular_queue.all?(nil)

    copy.delete(nil)
    circular_queue[circular_queue.index(copy.min)] = nil

    copy.min
  end
end

queue = CircularQueue.new(3)
queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
