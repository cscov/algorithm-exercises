require_relative 'graph'
# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  queue = []
  sorted = []
  graph = Graph.new(vertices)


  enqueue(graph.vertices, queue)
  sorted = dequeue(queue, sorted, graph)


  sorted
end

def enqueue(vertices, queue)
  vertices.each do |vertex|
    if vertex.in_edges.empty?
      queue.push(vertex)
    end
  end

end

def dequeue(queue, sorted, graph)
  while !queue.empty?
    vertex = queue.pop

    graph.destroy_vertex(vertex)
    sorted.push(vertex)

    neighbors = []
    while vertex.out_edges.length != 0
      edge = vertex.out_edges[0]
      if sorted.include?(edge.to_vertex) || edge.to_vertex.out_edges.empty?
        # cycle
        sorted = []
        return sorted
      end
      neighbors.push(edge.to_vertex)
      edge.destroy!
    end
    vertex.destroy!
    enqueue(neighbors, queue)
  end
  sorted
end
