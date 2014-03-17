# A simple Node class.  A LinkList will be composed of many
# nodes.
class Node

  attr_accessor :value, :prev_value, :next_value
  
  def initialize(value, prev_value=nil, next_value=nil)
    @value = value
    @prev_value = prev_value
    @next_value = next_value
  end
end
