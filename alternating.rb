def alternatingCharacters(s)
  count = 0
  0.upto(s.size - 2) { |idx| count += 1 if s[idx] == s[idx+1] }
  count
end

puts alternatingCharacters('AAAA') == 3
puts alternatingCharacters('BBBBB') == 4
puts alternatingCharacters('ABABABAB') == 0
puts alternatingCharacters('BABABA') == 0
puts alternatingCharacters('AAABBB') == 4