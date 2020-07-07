# https://www.hackerrank.com/challenges/pairs/problem

# TWO POINTER
def pairs_archived(k, arr)
  arr = arr.sort
  count = 0
  l = 0
  r = 0
  while(r < arr.size) do
    if arr[r] - arr[l] == k
      count += 1
      r += 1
      l += 1
    elsif arr[r] - arr[l] > k
      l += 1
    else
      r += 1
    end
  end
  count
end

puts pairs(2, [1, 5, 3, 4, 2]) #== 3