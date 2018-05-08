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
    @depth = 0
  end

  def insert(value)
    if root == nil
      @root = BSTNode.new(value)
      @tree_values.push(value)
      @node_count += 1
      return
    end
    parent = search(root, value)
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

    current_node = search(tree_node, value)
    return current_node if check_current_node_value(current_node) == value
  end

  def delete(value)
    if root.value == value
      @root = nil
      return
    end
    node = find(value)
    if !node.left && !node.right
      parent = node.parent
      if parent.left.value == value
        parent.left = nil
      else
        parent.right = nil
      end
      node = nil

    elsif node.left && !node.right
      if compare_values(node.parent.value, node.left.value) == 1
        node.parent.left = node.left
      else
        node.parent.right = node.left
      end
    elsif !node.left && node.right
      if compare_values(node.parent.value, node.right.value) == 1
        node.parent.left = node.right
      else
        node.parent.right = node.right
      end
    else
      max_node = maximum(node.left)
      if max_node.right
        max_node.parent.right == max_node.right
      else
        max_node.parent.right = max_node.left
      end
      if compare_values(node.value, node.parent.value) == 1
        node.parent.right = max_node
      else
        node.parent.left = max_node
      end
      node = nil
    end

    @node_count -= 1
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    max = tree_node
    while tree_node.right
      max = tree_node.right
      tree_node = tree_node.right
    end
    max
  end

  def depth(tree_node = @root)
    leaves = []
    @tree_values.each do |val|
      node = find(val)
      leaves.push(node) if !node.left && !node.right
    end
    interim_depth = 0
    leaves.each do |leaf_node|
      if leaf_node.value <= tree_node.value
        left_side = true
        right_side = false
      else
        left_side = false
        right_side = true
      end
      while leaf_node != tree_node
        next if left_side == true && leaf_node.value > root.value
        next if right_side == true && leaf_node.value < root.value
        leaf_node = leaf_node.parent
        interim_depth += 1
      end
      @depth = interim_depth if interim_depth > @depth
      interim_depth = 0
    end
    @depth
  end

  def is_balanced?(tree_node = @root)
    if tree_node.left
      left_depth = depth(tree_node.left)
    else
      left_depth = 0
    end
    p left_depth
    if tree_node.right
      right_depth = depth(tree_node.right)
    else
      right_depth = 0
    end
    p right_depth
    diff = (left_depth - right_depth).abs
    if diff == 0 || diff == 1 && is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
      return true
    end
    false
  end

  def in_order_traversal(tree_node = @root, arr = [])
    # @tree_values.sort
    if tree_node.left
      in_order_traversal(tree_node.left, arr)
    end
    arr.push(tree_node.value) if !tree_node.nil?

    if tree_node.right
      in_order_traversal(tree_node.right, arr)
    end
    arr
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

  def search(node, value)
    if check_current_node_value(node).nil?
      nil
    elsif compare_values(node.value, value) == -1 && node.right
      search(node.right, value)
    elsif compare_values(node.value, value) == 1 && node.left
      search(node.left, value)
    else
      node
    end
  end

end
