def coin_change(total, amount)
  amount = ((total-amount) * 100).to_i
  denoms = [100, 50, 25, 10, 5, 1]
  out = []
  until amount == 0 do
    current_denom = denoms.shift
    out << amount/current_denom
    amount %= current_denom
  end
  out
end

puts coin_change(5, 3.17) == [1, 1, 1, 0, 1, 3]

