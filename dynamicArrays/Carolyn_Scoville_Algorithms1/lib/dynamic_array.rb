require_relative "static_array"
require 'byebug'

class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    initial_store = StaticArray.new(capacity)
    @store = initial_store
  end

  # O(1)
  def [](index)
    self.error()
    store[index]
  end

  # O(1)
  def []=(index, value)
    self.store[index] = value
  end

  # O(1)
  def pop
    raise 'index out of bounds' if length == 0
    # debugger
    popped = store[self.length - 1]
    store[self.length - 1] = nil
    self.length -= 1

    popped
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    store[self.length] = val
    self.length += 1

    store
  end

  # O(n): has to shift over all the elements.
  def shift
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
  end

  def error
    raise 'index out of bounds' if length == 0
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
  end
end
