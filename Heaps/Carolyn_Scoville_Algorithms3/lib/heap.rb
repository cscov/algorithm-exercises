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
    root = self.peek
    @store.last, store.first = store.first, store.last
    @store.pop

    BinaryMinHeap.heapify_up(@store, count - 1)
    root
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    BinaryMinHeap.heapify_up(@store, count - 1) if count > 1
  end

  public
  def self.child_indices(len, parent_index)
    current = parent_index
    child_indices = []
    child_indices << (2 * current) + 1 if (2 * current) + 1 < len
    child_indices << (2 * current) + 2 if (2 * current) + 2 < len
    child_indices
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    # debugger
    children = BinaryMinHeap.child_indices(len, parent_idx)
    if !children.empty?
      lesser = children[0]
      lesser = children[1] if children[1] && array[children[1]] < array[children[0]]
      while array[lesser] < array[parent_idx]
        array[lesser], array[parent_idx] = array[parent_idx], array[lesser]
        BinaryMinHeap.heapify_down(array, lesser)
      end
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    parent_idx = BinaryMinHeap.parent_index(child_idx)
    parent = array[parent_idx]
    while parent > array[child_idx]
      array[child_idx], array[parent_idx] = array[parent_idx],
                                                      array[child_idx]
    end
  end
end
