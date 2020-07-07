# rubocop:disable all

def toys(w)
  return 0 if w.count == 0
  return 1 if w.count == 1
  w = w.sort
  containers = 1
  min = w[0]
  w.each do |item|
    unless [min, min+1, min+2, min+3, min+4].include?(item)
      min = item
      containers += 1
    end
  end
  containers
end

puts toys([1, 2, 3, 21, 7, 12, 14, 21])
puts toys([12, 15, 7, 8, 19, 24])
