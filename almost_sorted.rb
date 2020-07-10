# https://www.hackerrank.com/challenges/almost-sorted/problem

def almostSorted(arr)
  out_of_indexes = []
  if arr == arr.sort
    puts 'yes'
    return
  elsif arr.size == 2
    puts 'yes'
    puts 'swap 1 2'
    return
  else
    0.upto(arr.size-2) do |idx|
      next if arr[idx] < arr[idx+1] # Proper so far
      out_of_indexes << idx
    end
    if out_of_indexes.size == 1
      new_arr = arr.dup
      new_arr[out_of_indexes.first], new_arr[out_of_indexes.first + 1] = new_arr[out_of_indexes.first + 1], new_arr[out_of_indexes.first]
      if new_arr == new_arr.sort
        puts 'yes'
        puts "swap #{out_of_indexes[0] + 1} #{out_of_indexes.last + 2}"
        return
      end
    elsif out_of_indexes.size == 2
      new_arr = arr.dup
      new_arr[out_of_indexes[0]], new_arr[out_of_indexes[1]+1] = new_arr[out_of_indexes[1]+1], new_arr[out_of_indexes[0]]
      if new_arr == new_arr.sort
        puts 'yes'
        puts "swap #{out_of_indexes[0] + 1} #{out_of_indexes.last + 2}"
        return
      end
    elsif out_of_indexes.size > 2
      0.upto(out_of_indexes.size - 2) do |idx|
        if out_of_indexes[idx + 1] - out_of_indexes[idx] != 1
          puts 'no'
          return
        end
      end
      puts 'yes'
      puts "reverse #{out_of_indexes[0] + 1} #{out_of_indexes.last + 2}"
      return
    end
  end
  puts 'no'
end

almostSorted([1, 2, 4, 3, 5, 6]) # ['yes', 'swap 3 4']
almostSorted([4, 2]) # ['yes', 'swap 1 2']
almostSorted([3, 1, 2]) # ['no']
almostSorted([1, 5, 4, 3, 2, 6]) # ['yes', 'reverse 2 5']
almostSorted([4104, 8529, 49984, 54956, 63034, 82534, 84473, 86411, 92941, 95929, 108831, 894947, 125082, 137123, 137276, 142534, 149840, 154703, 174744, 180537, 207563, 221088, 223069, 231982, 249517, 252211, 255192, 260283, 261543, 262406, 270616, 274600, 274709, 283838, 289532, 295589, 310856, 314991, 322201, 339198, 343271, 383392, 385869, 389367, 403468, 441925, 444543, 454300, 455366, 469896, 478627, 479055, 484516, 499114, 512738, 543943, 552836, 560153, 578730, 579688, 591631, 594436, 606033, 613146, 621500, 627475, 631582, 643754, 658309, 666435, 667186, 671190, 674741, 685292, 702340, 705383, 722375, 722776, 726812, 748441, 790023, 795574, 797416, 813164, 813248, 827778, 839998, 843708, 851728, 857147, 860454, 861956, 864994, 868755, 116375, 911042, 912634, 914500, 920825, 979477]) # ['yes', 'swap 12 95']

in_file = File.read('almost_sorted_in.txt').split("\n")[1].split(' ')
almostSorted(in_file)



