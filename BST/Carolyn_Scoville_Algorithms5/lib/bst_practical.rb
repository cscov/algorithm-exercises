require_relative 'binary_search_tree'

def kth_largest(tree_node, k)
  visited_nodes = []
  left_path = false
  right_path = false

  while visited_nodes.length < k
    visited_nodes << tree_node
    if tree_node.left
      visited_nodes << tree_node.left
      left_path = true
    end
    if tree_node.right
      visited_nodes << tree_node.right
      right_path = true
    end
    if left_path
      tree_node = tree_node.left
    elsif right_path
      tree_node = tree_node.right
    end
    visited_nodes.last
  end
end
