require 'byebug'
class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array == array.sort
    return if array.length <= 1
    pivot_idx = QuickSort.partition(array, 0, array.length)
    left = array[0...pivot_idx]
    QuickSort.sort1(left)

    right = array[pivot_idx + 1...array.length]
    QuickSort.sort1(right)

    array = left + [pivot] + right
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    # debugger
    return if array.length <= 1
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    p array
    pivot_idx = QuickSort.partition(array, start, length, &prc)
    p array
    left = QuickSort.sort2!(array, start, pivot_idx - start, &prc)
    # right = QuickSort.sort2!(array, pivot_idx + 1, length - pivot_idx - 1, &prc)
    p array

  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    pivot = array[start]
    pivot_idx = start
    boundary = start
    finish_idx = start + length - 1

    while finish_idx > boundary
      check_num = array[boundary + 1]
      if prc.call(check_num, pivot) == -1
        array[pivot_idx], array[boundary + 1] = array[boundary + 1], array[pivot_idx]
        pivot_idx = boundary + 1
        boundary += 1
      else
        p boundary
        p finish_idx
        p array
        array[boundary + 1], array[finish_idx] = array[finish_idx], array[boundary + 1]
        finish_idx -= 1
      end
    end

    boundary
  end
end
