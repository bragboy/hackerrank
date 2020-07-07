def camelcase(s)
  chars_arry = ('A'..'Z').to_a
  s.split('').select{|c| chars_arry.include?(c)}.count + 1
end

puts camelcase('whatIsThis') == 3