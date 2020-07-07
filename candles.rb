# rubocop:disable all

def candies(n, arr)
  return 1 if arr.length == 1
  arrays = []
  index = 0
  0.upto(n) do |v|
    if arr[v] == arr[v+1]
      arrays << arr[index..v]
      index = v + 1
    end
  end
  arrays = [arr] if index == 0
  arrays.map{|n_arr| sub_arr(n_arr.length, n_arr)}.sum
end

def sub_arr(n, arr)
  # first pass
  return 1 if arr.length == 1
  return 3 if arr.length == 2
  new_arr = Array.new(arr.length, '')
  puts "#{new_arr}"
  new_arr[n-1] = arr[n-1] > arr[n-2] ? 'end-high' : 'end-low'
  new_arr[0] = arr[0] > arr[1] ? 'end-high' : 'end-low'
  1.upto(n-2) do |i|
    if arr[i] > arr[i+1] && arr[i] > arr[i-1]
      new_arr[i] = 'peak'
    elsif arr[i] < arr[i+1] && arr[i] < arr[i-1]
      new_arr[i] = 'bottom'
    else
      new_arr[i] = 'mid'
    end
  end
  n.times do |i|
    new_arr[i] = 1 if ['bottom', 'end-low'].include?(new_arr[i])
  end
  puts "#{new_arr}"
  0.upto(n-1) do |i|
    if new_arr[i].to_i >= 1 && new_arr[i+1] == 'mid'
      new_arr[i+1] = new_arr[i].to_i + 1
    end
  end
  puts "#{new_arr}"
  (n-1).downto(0) do |i|
    if new_arr[i].to_i >= 1 && new_arr[i-1] == 'mid'
      new_arr[i-1] = new_arr[i].to_i + 1
    end
  end
  puts "#{new_arr}"
  n.times do |i|
    if new_arr[i] == 'peak'
      new_arr[i] = [new_arr[i-1], new_arr[i+1]].max + 1
    end
  end
  puts "#{new_arr}"
  new_arr[0] = new_arr[1] + 1 if new_arr[0] == 'end-high'
  new_arr[n-1] = new_arr[n-2] + 1 if new_arr[n-1] == 'end-high'
  new_arr.sum
end

# candies(11, [2, 4, 2, 6, 6, 7, 8, 1, 1, 1, 7])
# candies(11, [2, 4, 2, 6, 1, 7, 8, 9, 2, 1, 7])
candies(10, [2, 4, 2, 6, 1, 7, 8, 9, 2, 1])
candies(8, [2, 4, 3, 5, 2, 6, 4, 5])
candies(3, [1,2,2])