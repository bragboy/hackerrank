def solution(a)
  max_val = a.max
  return 1 if a.size == 0
  return 1 if max_val <= 0
  vals = a.select {|v| v.positive?}.uniq.sort
  vals.each_with_index do |val, ind|
    return (ind+1) if val != ind + 1
  end
  return vals.max + 1
end

puts solution([1, 3, 6, 4, 1, 2])