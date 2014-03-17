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

  def insert(index, value)
    return nil if index < 0 || index >= @length
    current_node = @head
    node = 0
    while node < index - 1
      current_node = current_node.next_value
      node += 1
    end
    new_node = Node.new(value)
    new_node.next_value = current_node.next_value
    current_node.next_value = new_node
  end

  # Given an index, returns the value at that index
  def [](index)
    return nil if index < 0 || index >= @length
    current_node = @head
    node = 0
    while node < index
      current_node = current_node.next_value
      node += 1
    end
    return current_node.value
  end

  # Sets a value at the given index.  Returns the value that
  # was assigned
  def []=(index, value)
    return nil if index < 0 || index >= @length
    current_node = @head
    node = 0
    while node < index
      current_node = current_node.next_value
      node += 1
    end
    current_node.value = value
    return current_node.value
  end

  # Returns the first value that was removed from the list and
  # shifts all items down by 1
  def shift
  end

  # Adds a new value to the front of the list
  def unshift(value)
  end

  def first
    self[0]
  end

  def last
    self[@length-1]
  end
end
