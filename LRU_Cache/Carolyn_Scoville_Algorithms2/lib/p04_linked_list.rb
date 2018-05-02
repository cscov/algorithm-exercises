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
    self.prev = self.next
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
    @tail.prev.next = new_node
    @tail.prev = new_node
    p self
  end

  def update(key, val)
    return if self.empty?
    current_node = get(key)
    current_node.val = val
  end

  def remove(key)
    node_to_remove = get(key)
    node_to_remove.remove
  end

  def each
    self.each do |node|
      yield(node)
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end
