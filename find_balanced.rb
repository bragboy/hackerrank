def find_balanced(pattern, k)
  as_chars = pattern.split('')
  return false if pattern.size % 2 == 1
  stack = []
  as_chars.each_with_index do |char, i|
    if stack.empty? && char == '>' # For sure a replacement is required
      return false if k == 0
      k -= 1
      stack.push('<')
      next
    end
    if char == '<' && stack.size == (as_chars.size - i) # For sure a replacement is required
      return false if k == 0
      k -= 1
      stack.pop
      next
    end
    stack.push('<') if char == '<'
    stack.pop if char == '>'
  end
  stack.empty?
end

# def find_balanced(input, max_replacements)
#   return false if input.size % 2 != 0
#   chars = input.chars
#   store = []
#   0.upto(chars.size - 1).each do |i|
#     if i == 0 && chars[i] == ">"
#       max_replacements -= 1
#       store.push(">")
#     elsif store.last == chars[i]
#       store.pop
#     elsif store.size == 1 && i == chars.size - 1
#       max_replacements -= 1
#       store.pop
#     else
#       store.push(">")
#     end
#   end
#   return true if store.empty?
#   max_replacements -= store.size / 2 if store.size > 0
#   max_replacements >= 0
# end

puts find_balanced("<>><", 2) == true
puts find_balanced("<>>>>", 2) == false
puts find_balanced("<>", 2) == true
puts find_balanced("<<<<<<>>", 2) == true
puts find_balanced("<<<<<<>>", 1) == false
puts find_balanced("<<<<<<>>", 0) == false
puts find_balanced("<><<", 1) == true
puts find_balanced("<<<<", 1) == false
puts find_balanced("<<", 1) == true
puts find_balanced("<<<<<<<<", 4) == true
puts find_balanced("<<<<<<<<", 99) == true
puts find_balanced(">><<", 2) == true