# https://www.hackerrank.com/challenges/anagram/problem

def anagram(s)
  return -1 if s.size % 2 == 1
  freq1 = s[0..(s.size/2-1)].chars.group_by(&:itself).transform_values!(&:size)
  freq2 = s[(s.size/2)..(s.size-1)].chars.group_by(&:itself).transform_values!(&:size)
  diff = 0
  ('a'..'z').to_a.each { |char| diff += (freq1[char].to_i - freq2[char].to_i).abs }
  diff/2
end

puts anagram('aaabbb') == 3
puts anagram('ab') == 1
puts anagram('abc') == -1
puts anagram('mnop') == 2
puts anagram('xyyx') == 0
puts anagram('xaxbbbxx') == 1
