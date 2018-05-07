# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'
require "byebug"

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
    @node_count = 0
    @tree_values = []
  end

  def insert(value)
    if root == nil
      @root = BSTNode.new(value)
      @tree_values.push(value)
      @node_count += 1
      return
    end
    parent = traverse(root, value)
    if parent.nil?
      parent = root
    end
    if compare_values(parent.value, value) <= 0
      parent.right = BSTNode.new(value)
      node = parent.right
    else
      parent.left = BSTNode.new(value)
      node = parent.left
    end
    node.parent = parent
    @node_count += 1
    @tree_values.push(value)
  end

  def find(value, tree_node = @root)
    return nil if root.nil?

    current_node = traverse(tree_node, value)
    return current_node if check_current_node_value(current_node) == value
  end

  def delete(value)
    @root = nil if root.value == value
    node = find(value)

    @node_count -= 1
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])

    arr.sort
  end


  private
  # optional helper methods go here:
  def check_current_node_value(node)
    return nil if node.nil?
    node.value
  end

  def compare_values(val1, val2)
    val1 <=> val2
  end

  def traverse(node, value)
    if check_current_node_value(node).nil?
      nil
    elsif compare_values(node.value, value) == -1 && node.right
      traverse(node.right, value)
    elsif compare_values(node.value, value) == 1 && node.left
      traverse(node.left, value)
    else
      node
    end
  end
end
