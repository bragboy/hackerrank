def xorAndSum(a, b)
  dec_a = a.to_i(2)
  dec_b = b.to_i(2)
  sum = 0
  0.upto(314159) { |i| sum += dec_a ^ (dec_b << i) }
  sum % (10**9 + 7)
end

puts xorAndSum("10", "1010")