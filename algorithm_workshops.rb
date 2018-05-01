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
