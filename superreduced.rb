def superReducedString(s)
  return s if s.size == 1
  str = s.split('')
  prevrun = -1
  loop do
    str.each_with_index do |char, i|
      break if i+1 == s.size
      if str[i] == str[i+1]
        str[i] = nil
        str[i+1] = nil
      end
    end
    str.compact!
    prevrun == str.join ? break : prevrun = str.join
  end
  prevrun.to_s == '' ? 'Empty String' : prevrun
end

puts superReducedString('aaabccddd') == 'abd'
puts superReducedString('aa') == 'Empty String'
puts superReducedString('baab') == 'Empty String'
puts superReducedString('ppffccmmssnnhhbbmmggxxaaooeeqqeennffzzaaeeyyaaggggeessvvssggbbccnnrrjjxxuuzzbbjjrruuaaccaaoommkkkkxx') == 'Empty String'