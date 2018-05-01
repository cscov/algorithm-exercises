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
  end

  # O(1) ammortized
  def unshift(val)
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise 'index out of bounds' if length == 0 || index < 0 ||
                                   index > capacity
  end

  def resize!
  end
end
