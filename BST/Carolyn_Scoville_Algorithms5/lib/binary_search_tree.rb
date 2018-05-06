# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(value)
    if root == nil
      root.value = value
      return
    end
    parent = traverse(root, value)
    if compare_values(parent.value, value) <= 0
      parent.left = BSTNode.new(value)
      node = parent.left
    else
      parent.right = BSTNode.new(value)
      node = parent.right
    end
    node.parent = parent
  end

  def find(value, tree_node = @root)
  end

  def delete(value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:
  def check_current_node_value(node)
    node.value
  end

  def compare_values(val1, val2)
    val1 <=> val2
  end

  def has_left_child(node)
    node.left.nil?
  end

  def has_right_child(node)
    node.right.nil?
  end

  def traverse(node, value)
    if check_current_node_value(node).nil?
      nil
    elsif compare_values(node.value, value) <= 0 && node.has_left_child
      traverse(node.left, value)
    elsif compare_values(node.value, value) == 1 && node.has_left_child
      traverse(node.right, value)
    else
      node
    end
  end
end
