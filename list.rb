# A List class that should be implemented as
# a doubly linked list.  Also, it is important
# to keep track of a head and tail pointer
# for this lab.

# The following methods are the most important
# to implement and should be done first:

# new, push, pop, and length

# The following methods are nice to have and should
# be implemented next:

# [], []=, insert, shift, unshift, first, last

# The following methods are bonus and should only be tackled
# after the previous methods are implemented:

# reverse, max, min, reduce, each, flatten
require './node.rb'

class List

  attr_accessor :head, :tail
  attr_reader :length

  def initialize()
    @head = nil
    @tail = nil
    @length = 0
  end

  # Adds a new value to the end of the list.
  def push(value)
    new_node = Node.new(value)
    if length > 0
      new_node.prev_value = @tail
      @tail.next_value = new_node
      @tail = new_node
      if length == 1
        @head.next_value = new_node
        new_node.prev_value = head
      end
    else
      @head = new_node
      @tail = new_node
    end
    @length += 1
    return new_node.value
  end

  # Returns the value that is popped off
  # or nil if none exists
  def pop
    old = @tail
    if @tail == nil
      return nil
    else
      prev = @tail
      @tail = @tail.prev_value
      @length -= 1
      return prev.value
    end
  end

  def find_node(index)
    return nil if index < 0 || index >= @length
    current_node = @head
    node = 0
    while node < index
      current_node = current_node.next_value
      node += 1
    end
    return current_node
  end

  def insert(index, value)
    current_node = find_node(index)
    if @head == nil || current_node == @tail
      return push(value)
    else
      current_node = current_node.prev_value
      new_node = Node.new(value)
      new_node.next_value = current_node.next_value
      current_node.next_value = new_node
      @length += 1
    end
  end

  # Given an index, returns the value at that index
  def [](index)
    node = find_node(index)
    if node != nil then return node.value else return nil end
  end

  # Sets a value at the given index.  Returns the value that
  # was assigned
  def []=(index, value)
    node = find_node(index)
    node.value = value
  end

  # Returns the first value that was removed from the list and
  # shifts all items down by 1
  def shift
  end

  # Adds a new value to the front of the list
  def unshift(value)
  end

  def first
    @head.value
  end

  def last
    @tail.value
  end
end
