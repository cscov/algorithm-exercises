require 'byebug'
class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []

  end

  def count
    @store.length
  end

  def extract
    # debugger
    root = self.peek
    @store[-1], store[0] = store[0], store[-1]
    @store.pop

    BinaryMinHeap.heapify_down(@store, 0, @store.length)
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
    return array if parent_idx >= len - 1
    prc ||= Proc.new do |el1, el2|
      el1 <=> el2
    end
    children = BinaryMinHeap.child_indices(len, parent_idx)
    if !children.empty?
      if children[1]
        if prc.call(array[children[1]], array[children[0]]) <= 0
          chosen = children[1]
        else
          chosen = children[0]
        end
      else
        chosen = children[0]
      end

      if prc.call(array[parent_idx], array[chosen]) == 1
        array[chosen], array[parent_idx] = array[parent_idx], array[chosen]
        BinaryMinHeap.heapify_down(array, chosen, len = array.length, &prc)
      end
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if child_idx == 0
    prc ||= Proc.new do |el1, el2|
      el1 <=> el2
    end
    parent_idx = BinaryMinHeap.parent_index(child_idx)
    parent = array[parent_idx]
    if prc.call(array[child_idx], array[parent_idx]) <= 0
      array[child_idx], array[parent_idx] = array[parent_idx],
                                            array[child_idx]
      child_idx = parent_idx
      BinaryMinHeap.heapify_up(array, child_idx, len = array.length, &prc)
    end
    array
  end
end
