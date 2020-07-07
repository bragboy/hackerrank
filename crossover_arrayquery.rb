def coolFeature(a, b, query)
  output = []
  b_hash = {}
  b.each do |b_val|
    b_hash[b_val] ||= 0
    b_hash[b_val] += 1
  end
  until query.empty?
    q = query.shift
    if q[0] == 1 # Finding case
      sum = q[1]
      count = 0
      a.each{ |a_val| count += b_hash[sum-a_val] if b_hash[sum-a_val] }
      output << count
    else
      old_val = b[q[1]]
      new_val = q[2]
      b_hash[old_val] ||= 0
      b_hash[old_val] -= 1
      b[q[1]] = new_val
      b_hash[new_val] ||= 0
      b_hash[new_val] += 1
    end
  end
  output
end

puts coolFeature([1,2,3], [3, 4], [[1, 5], [0,0,1], [1,5]]) == [2, 1]
puts coolFeature([1,2,2], [2, 3], [[1, 4], [0,0,3], [1,5]]) == [3, 4]
puts coolFeature([1,0,1], [2, 0, 2], [[1, 0]]) == [1]
