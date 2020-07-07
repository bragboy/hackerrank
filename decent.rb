# rubocop:disable all

def decentNumber(n)
  if [1, 2, 4, 7].include?(n)
    puts "-1"
    return
  end
  count_5s = 0
  count_3s = 0
  k = 0
  n.downto(1) do |i|
    if i % 3 == 0 && (n-i) % 5 == 0
      k = i
      break
    end
  end
  puts "#{'5'*(k)}#{'3'*(n-k)}"
end

puts decentNumber(1)
puts decentNumber(3)
puts decentNumber(5)
# puts decentNumber(6)
# puts decentNumber(8)
# puts decentNumber(9)
# puts decentNumber(10)
puts decentNumber(11)
# puts decentNumber(12)
# puts decentNumber(13)
# puts decentNumber(14)
# puts decentNumber(15)
# puts decentNumber(16)


# 3 =  0 + 3
# 5 =  5 + 0
# 6 =  0 + 6
# 8 =  5 + 3
# 9 =  0 + 9
#10 = 10 + 0
#11 =  6 + 5
#12 =  0 + 12
#13 = 10 + 3
#14 =  5 + 9