=begin

#Problem

- complete this class so that the test cases shown below work as intended
- we can add any methods or instance variables we need, but do not make the implementation details public
  - you may assume that the input will always fit in your terminal window

#Input



#Output

#Examples

# Rules + Questions

- we'll instantiate a new object from the Banner class that takes one argument: a string
- we'll then call the puts method on the new object we instantiated
- this should output a box with the string argument appearing in the middle of the box

#Algorithm 

# Implementation Notes 

- we need a Banner class
- we need a constructor method that takes one argument: a string
- we need to instansiate a new ojbect from the Banner class called banner
- when we call puts on banner, we need this to output a box with the string object in the middle

- we need to fill in some code in all th definitions that are called in the to_s method

=end

class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    '+' + ('-' * (@message.length + 2)) + '+'
  end

  def empty_line
    '|' + (' ' * (@message.length + 2)) + '|'
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

banner = Banner.new('You did it')
puts banner

banner = Banner.new('Does this look like it fits?')
puts banner