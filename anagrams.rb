def makingAnagrams(s1, s2)
  s1.size + s2.size - intersect(s1.split(''), s2.split('')).size * 2
end

def intersect(a1, a2)
  intersect = []
  a1.each {|val| intersect << a2.delete_at(a2.index(val)) if a2.index(val)}
  intersect
end

puts makingAnagrams('cde', 'abc')
puts makingAnagrams('absdjkvuahdakejfnfauhdsaavasdlkj', 'djfladfhiawasdkjvalskufhafablsdkashlahdfa')

# puts "#{intersect([1,1,2,3,4,2],[1,1,2,2,3])}"