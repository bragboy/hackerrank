def minimumNumber(n, password)
  return 6 if n == 0
  numbers = "0123456789".split('')
  lower_case = "abcdefghijklmnopqrstuvwxyz".split('')
  upper_case = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split('')
  special_characters = "!@#$%^&*()-+".split('')

  ps = password.split('')
  uniq_reqd = 0
  uniq_reqd += 1 if (ps & numbers).size == 0
  uniq_reqd += 1 if (ps & lower_case).size == 0
  uniq_reqd += 1 if (ps & upper_case).size == 0
  uniq_reqd += 1 if (ps & special_characters).size == 0
  chars_reqd = 6-n > 0 ? 6-n : 0
  # require 'pry'; binding.pry
  if chars_reqd >= uniq_reqd
    return chars_reqd
  else
    return uniq_reqd
  end
end

puts minimumNumber(3, 'Ab1') #== 3
puts minimumNumber(11, '#HackerRank') #== 1
puts minimumNumber(4, 'aB#1') #== 2
puts minimumNumber(5, 'aaB#1') #== 1
puts minimumNumber(1, '#') #== 5
puts minimumNumber(6, '######') #== 3