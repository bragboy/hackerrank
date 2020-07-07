def fibonacciModified(t1, t2, n)
  first, second = t1, t2
  3.upto(n) do
    tmp = second
    second = first + (second * second)
    first = tmp
  end
  second
end

puts fibonacciModified(0, 1, 20)

