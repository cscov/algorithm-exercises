require_relative 'binary_search_tree'

def kth_largest(tree_node, k)
  values = tree_node.in_order_traversal
  values[-1 - k]
end
