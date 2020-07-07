def alternate(s)
  chars = s.split('')
  uniq_chars = chars.uniq
  return 0 if uniq_chars.size < 2
  distinct_pairs = []
  0.upto(uniq_chars.size - 1) do |i|
    (i+1).upto(uniq_chars.size - 1) do |j|
      distinct_pairs << [uniq_chars[i], uniq_chars[j]]
    end
  end
  max = 0
  distinct_pairs.each do |pair|
    str = chars.select{|k| pair.include?(k)}
    max = str.length if alternating?(str) && max < str.length
  end
  max
end

def alternating?(str)
  odd = []
  even = []
  str.each_with_index do |char, idx|
    odd << char if idx.even?
    even << char if idx.odd?
  end
  str[0] != str[1] && odd.uniq.size == 1 && even.uniq.size == 1
end

puts alternate('beabeefeab')
# puts alternating?('ababababb'.split(''))