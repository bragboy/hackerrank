def stringConstruction(s)
  s.split('').uniq.size
end

puts stringConstruction('abcd')
puts stringConstruction('abab')