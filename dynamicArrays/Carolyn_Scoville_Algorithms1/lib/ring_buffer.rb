require_relative "static_array"

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
    popped = store[length - 1]

    store[length - 1] = nil
    self.length -= 1

    popped
  end

  # O(1) ammortized
  def push(val)
    resize! if length == capacity

    store[length] = val
    self.length += 1

    store
  end

  # O(1)
  def shift
    self.start_idx = 1
    shifted = store[0]
    self.length -= 1

    shifted
  end

  # O(1) ammortized
  def unshift(val)
    resize! if length == capacity

    if store[0] == nil
      store[0] = val
      self.start_idx = 0
    else
      store[length] = val
      self.start_idx = length
    end
    self.length += 1
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
