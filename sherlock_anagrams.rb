# Complete the sherlockAndAnagrams function below.
def sherlockAndAnagrams(s)
  return (s.size * (s.size + 1))/2 if s.chars.sort[0] == s.chars.sort[s.size - 1]
  s = s.chars
  out = 0
  s.size.times do |split_length|
    freq_hash = {}
    0.upto(s.size - split_length - 1) do |i|
      str = s[i..(i+split_length)].sort.join
      freq_hash[str] ||= 0
      freq_hash[str] += 1
    end
    puts "#{freq_hash}"
    out += freq_hash.to_a.sum { |c| c[1]-1 }
  end
  out
end

# puts sherlockAndAnagrams('ifailuhkqq') == 3
puts sherlockAndAnagrams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
# puts sherlockAndAnagrams('abba') == 4
# puts sherlockAndAnagrams('abcd') == 0
# puts sherlockAndAnagrams('mom') == 2
puts sherlockAndAnagrams('cdcd') == 5