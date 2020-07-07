def marsExploration(s)
  messages = s.split('').each_slice(3).to_a.map{|c| c.join}
  bad = 0
  messages.each do |msg|
    bad += 1 if msg[0] != 'S'
    bad += 1 if msg[1] != 'O'
    bad += 1 if msg[2] != 'S'
  end
  bad
end

puts marsExploration('SOSSPSSQSSOR')
puts marsExploration('SOSOOSOSOSOSOSSOSOSOSOSOSOS')