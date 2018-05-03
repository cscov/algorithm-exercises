require_relative "heap"

class Array
  def heap_sort!
    return self if self.sort == self

    prc = Proc.new do |el1, el2|
      -1 * (el1 <=> el2)
    end
    BinaryMinHeap.heapify_down(self, 0, len = self.length, &prc)
    boundary = 1
    smallest = self.length - 1
    while self != self.sort && boundary < self.length
      if self[boundary - 1] > self[smallest]
        self[boundary - 1], self[smallest] = self[smallest], self[boundary - 1]
      end
      if self[boundary - 1] < self[smallest]

        smallest -= 1
      end
      boundary += 1
    end
    self
  end
end
