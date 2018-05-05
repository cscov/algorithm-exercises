# [0112233] mid index is 3
# []
  def find_single_element(arr)
    mid_idx = arr.length / 2
    if arr[mid_idx] != arr[mid_idx + 1]
      arr[mid_idx]
    end
  end

  # example input
  #  true ( [ ] ) { ( ) }
  # false [ ( ] { ) }
  def well_formed_string(str)
    well_formed = %w(( ) [ ] { })
    left_stack = []
    str.each_char { |chr|  }
  end

def merge_intervals(array)
  array.sort!
  array.each_with_index do |subarray, idx|
    next if idx == array.length - 1
    next_sub_zero = array[idx + 1].first
    next_sub_first = array[idx + 1].last
    if next_sub_zero < subarray.last
      subarray[1] = next_sub_first
      array.delete(array[idx + 1])
    end
  end
  p array
end

  arr = [[1, 3], [2, 6], [8, 10], [15, 18]]
  merge_intervals(arr)
