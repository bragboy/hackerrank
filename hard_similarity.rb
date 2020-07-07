def stringSimilarity(s)
  suffixes = []
  s.size.times {|i| suffixes << s[i..(s.size-1)] }
  total = 0
  suffixes.each do |suffix|
    suffix.split('').each_with_index do |char, i|
      char == s[i] ? total += 1 : break
    end
  end
  total
end

# puts stringSimilarity('ababaa')