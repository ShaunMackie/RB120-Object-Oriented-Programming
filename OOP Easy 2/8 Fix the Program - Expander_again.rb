=begin

#Problem

- What is wrong with the following code?
- What fix(s) would you make?

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

# Implementation Notes 

=end

class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    self.expand(3)
  end

  protected

  #could also leave it as private and remove self from line 28

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander
#puts expander.expand