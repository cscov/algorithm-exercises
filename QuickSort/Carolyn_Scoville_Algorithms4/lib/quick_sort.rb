require 'byebug'
class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    pivot_idx = QuickSort.partition(array, 0, array.length)
    left = array[start...pivot_idx]
    right = array[pivot_idx + 1...array.length]


  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
  end

  def self.partition(array, start, length, &prc)
    # debugger

    pivot = array[start]
    pivot_idx = array.index(pivot)
    boundary = start
    finish_idx = start + length - 1

    while boundary != finish_idx
      check_num = array[boundary + 1]
      if check_num < pivot
        array[pivot_idx], array[boundary + 1] = array[boundary + 1], array[pivot_idx]
        pivot_idx = array.index(pivot)
        boundary += 1
      else
        array[boundary + 1], array[finish_idx] = array[finish_idx], array[boundary + 1]
        finish_idx -= 1
      end
    end

    array.index(pivot)
  end
end
