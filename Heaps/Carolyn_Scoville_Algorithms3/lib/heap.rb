require 'byebug'
class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    if prc.nil?
      @prc = Proc.new { |el1, el2| -1 * (el1 <=> el2) }
    else
      @prc = prc
    end
  end

  def count
    @store.length
  end

  def extract
  end

  def peek
  end

  def push(val)
  end

  public
  def self.child_indices(len, parent_index)
    # debugger
    current = parent_index
    child_indices = []
    child_indices << (2 * current) + 1 if (2 * current) + 1 < len
    child_indices << (2 * current) + 2 if (2 * current) + 2 < len
    child_indices
  end

  def self.parent_index(child_index)
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
