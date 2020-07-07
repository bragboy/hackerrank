def caesarCipher(s, k)
  k %= 26
  ord_array = s.split('').map{|c| c.ord}
  ord_array.each_with_index do |ord_val, idx|
    new_val = ord_array[idx]
    if (65..90).to_a.include?(ord_val)
      new_val = ord_val + k
      new_val = (new_val - 90) + 64 if new_val > 90
    end
    if (97..122).to_a.include?(ord_val)
      new_val = ord_val + k
      new_val = (new_val - 122) + 96 if new_val > 122
    end
    ord_array[idx] = new_val
  end
  ord_array.map{|c| c.chr}.join
end

puts caesarCipher('middle-Outz', 2)