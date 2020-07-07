def twoStrings(s1, s2)
  (s1.split('') & s2.split('')).size > 0 ? 'YES' : 'NO'
end

puts twoStrings('hello', 'world')
puts twoStrings('hi', 'world')