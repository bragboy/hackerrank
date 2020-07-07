# rubocop:disable all

def largestPermutation(k, arr)
  index_dict = {}
  arr.each_with_index do |v, idx|
    index_dict[v] = idx
  end
  out_arr = []
  sorted_arr = arr.sort
  arr.each_with_index do |elem, idx|
    if sorted_arr[idx] == elem
      out_arr << elem
    else
      out_arr[idx] = sorted_arr[idx]

    end
  end
end


