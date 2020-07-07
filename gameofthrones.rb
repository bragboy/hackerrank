def gameOfThrones(s)
  metadata = s.split('').group_by(&:itself).transform_values!(&:size)
  total_odds = metadata.values.count{|c| c.odd?}
  return 'YES' if s.size.even? && total_odds == 0 || s.size.odd? && total_odds == 1
  'NO'
end

puts gameOfThrones('aaabbbb')
puts gameOfThrones('cdefghmnopqrstuvw')
puts gameOfThrones('cdcdcdcdeeeef')