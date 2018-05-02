require 'byebug'

class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    prev_node = self.prev
    prev_node.next = self.next
    next_node = self.next
    next_node.prev = self.prev
    self.key = nil
    self.val = nil
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new

    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    return nil if self.empty?
    current_node = first
    while current_node.key != key
      return nil if current_node == last
      current_node = current_node.next
    end
    current_node.val
  end

  def include?(key)
    to_find = get(key)
    return false if to_find.nil?
    true
  end

  def append(key, val)

    new_node = Node.new(key, val)
    new_node.next = @tail
    new_node.prev = @tail.prev
    @tail.prev.next = new_node
    @tail.prev = new_node
  end

  def update(key, val)
    return if self.empty?
    current_node = get(key)
    current_node.val = val
  end

  def remove(key)
    current_node = first
    while current_node.key != key && current_node != last
      current_node = current_node.next
    end
    current_node.remove
  end

  def each
    # debugger
    current_node = first
    while current_node != last.next
      yield(current_node)
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end
