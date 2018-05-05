class BSTNode
  attr_reader :value
  attr_accessor :left, :right
  def initialize(value)
    @value = value
    @right = nil
    @left = nil
  end
end
