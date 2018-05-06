class BSTNode
  attr_reader :value
  attr_accessor :left, :right, :parent
  def initialize(value)
    @value = value
    @right = nil
    @left = nil
    @parent = nil
  end
end
