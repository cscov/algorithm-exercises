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
    self.error
    self.check_index(index)

    store[index]
  end

  # O(1)
  def []=(index, value)
    self.store[index] = value
  end

  # O(1)
  def pop
    self.error
    popped = store[self.length - 1]
    store[self.length - 1] = nil
    self.length -= 1

    popped
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    # debugger
    self.resize! if length == capacity
    store[self.length] = val
    self.length += 1

    store
  end

  # O(n): has to shift over all the elements.
  def shift
    self.error
    shifted = self.store[0]

    start_index = 1
    while start_index < self.length
      store[start_index - 1] = store[start_index]
      start_index += 1
    end
    self.length -= 1
    shifted
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    # debugger
    start_index = self.length - 1
    while start_index >= 0
      store[start_index + 1] = store[start_index]
      start_index -= 1
    end
    store[0] = val
    self.length += 1

    store
  end

  def error
    raise 'index out of bounds' if length == 0
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise 'index out of bounds' if store[index].nil?
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_store = StaticArray.new(capacity * 2)
    new_capacity = capacity * 2

    start_index = 0
    while start_index < self.length
      new_store[start_index] = store[start_index]
      start_index += 1
    end

    @store = new_store
    @capacity = new_capacity
  end
end
