class Vertex
  attr_reader :value
  attr_accessor :in_edges, :out_edges
  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end
end

class Edge
  def initialize(from_vertex, to_vertex, cost = 1)

  end

  def destroy!

  end
end
