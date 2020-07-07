def temp(arr)
  n = arr.size
  fut = Array.new(n, 0)

  maxAfter = arr[n - 1]

  (n-2).downto(0) do |i|
    if arr[i] < maxAfter
      fut[i] = 1
    else
      maxAfter = arr[i]
    end
  end

  puts "#{fut}"
end


temp([5,2,4,1,4,7,2,4,3])
temp((1..8).to_a.reverse)