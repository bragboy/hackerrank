# rubocop:disable all
def highestValuePalindrome(s, n, k)
  if k == 0
    return s if s == s.reverse
    return -1
  end
  if s.size == 1
    return '9' if k >= 1
    return s
  end
  str = s.split('')
  bad_pos = []
  0.upto(n/2 - 1) { |i| bad_pos << i if str[i] != str[n-i-1] }
  return -1 if bad_pos.size > k

  excess_ks = k - bad_pos.size + 1
  (bad_pos.size - 1).downto(1) do |pos_index|
    max_val = [str[pos_index], str[n-pos_index-1]].max
    str[pos_index] = max_val
    str[n-pos_index-1] = max_val
  end

  last_bad_pos = bad_pos[0]

  if excess_ks > 2
    if last_bad_pos
      if excess_ks % 2 == 0
        total_replace = excess_ks - 2
        excess_ks = 2
      else
        total_replace = excess_ks - 1
        excess_ks = 1
      end
    else
      total_replace = excess_ks
    end
    non_9_indexes = str[0..(str.length/2)].each_with_index.map{|str, index| index if str != '9'}.compact
    puts "NONE: #{non_9_indexes}"
    (total_replace/2).times do
      break if non_9_indexes.empty?
      pos_index = non_9_indexes.shift
      str[pos_index] = 9
      str[n-pos_index-1] = 9
    end
  end

  if s == s.reverse && s.size % 2 == 1 && k == 1
    s[]
  end

  if bad_pos.size > 0
    if excess_ks == 1
      max_val = [str[last_bad_pos], str[n-last_bad_pos-1]].max
      str[last_bad_pos] = max_val
      str[n-last_bad_pos-1] = max_val
    end
    if excess_ks == 2
      str[last_bad_pos] = 9
      str[n-last_bad_pos-1] = 9
    end
  end

  str.join
end

# puts highestValuePalindrome("777", 3, 0)
# puts highestValuePalindrome("5", 1, 1)
# puts highestValuePalindrome("932239", 6, 2)
puts highestValuePalindrome("12321", 5, 1)


# puts highestValuePalindrome("092282", 6, 3)
# puts highestValuePalindrome("3943", 4, 1)

# puts highestValuePalindrome("981289", 6, 1) == "982289"
# puts highestValuePalindrome("981289", 6, 2) == "989989"
# puts highestValuePalindrome("981289", 6, 3) == "992299"
# puts highestValuePalindrome("981289", 6, 4) == "999999"
# puts highestValuePalindrome("981289", 6, 5) == "999999"
# puts highestValuePalindrome("891298", 6, 3) == "992299"