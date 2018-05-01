require_relative "static_array"
require 'byebug'

class RingBuffer
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(capacity)
    @start_idx = 0
  end

  # O(1)
  def [](index)
    check_index(index)

    store[index]
  end

  # O(1)
  def []=(index, val)
    check_index(index)

    store[index] = val
  end

  # O(1)
  def pop
    last = (start_idx - 1) % capacity
    popped = store[last]

    store[last] = nil
    self.length -= 1

    popped
  end

  # O(1) ammortized
  def push(val)
    # debugger
    resize! if length == capacity

    if length == 0
      store[start_idx] = val
      self.length += 1
      return store
    end
    last = (length) % capacity
    store[last] = val
    self.length += 1

    store
  end

  # O(1)
  def shift
    shifted = store[start_idx % capacity]
    self.start_idx += 1
    self.length -= 1

    shifted
    # p self
  end

  # O(1) ammortized
  def unshift(val)
    # debugger
    resize! if length == capacity
    if length == 0
      store[start_idx % capacity] = val
      self.length += 1
      return store
    end
    start = self.length - 1
    while start >= 0
      store[start + 1] = store[start]
      start -= 1
    end
    store[start_idx % capacity] = val
    self.length += 1
    # p self
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise 'index out of bounds' if length == 0 || index < 0 ||
                                   index > capacity
  end

  def resize!
    new_capacity = capacity * 2
    new_store = StaticArray.new(new_capacity)
    start = 0
    while start < self.length
      new_store[start] = store[start]
      start += 1
    end
    @store = new_store
    @capacity = new_capacity
  end
end
