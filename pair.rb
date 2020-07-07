# rubocop:disable all

def beautifulPairs(a, b)
  a_group = a.group_by(&:itself).transform_values!(&:size)
  b_group = b.group_by(&:itself).transform_values!(&:size)
  require 'pry'; binding.pry
  total = 0
  a_group.keys.each do |key|
    total += [a_group[key], b_group[key]].min if a_group[key].to_i > 0 && b_group[key].to_i > 0
  end
  total == a.size ? a.size - 1 : total + 1
end

puts beautifulPairs([1, 2, 3, 4], [1, 2, 3, 3])
puts beautifulPairs([3, 5, 7, 11, 5, 8], [5, 7, 11, 10, 5, 8])
puts beautifulPairs([1], [1])


# 3 5 5 7 8 11
#   5 5 7 8 10 11