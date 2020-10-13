=begin

#Problem

- modify the below-given class so both flip_switch and the setter method switch= are private methods.

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

# Implementation Notes 

=end


class Machine
  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  private

  attr_writer :switch

  protected

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

switch = Machine.new
switch.stop
p switch
switch.start
p switch

# switch.flip_switch('testing')

# p switch