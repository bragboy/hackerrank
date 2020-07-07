def init(s)
  @str = s
  n = s.length
  @mod = 1000000007
  @fact_cache = [1]
  uniq_chars = 4
  csum = Array.new(uniq_chars){Array.new(n + 1)}
  uniq_chars.times{|idx| csum[idx][0] = 0}
  1.upto(n) do |i|
    id = @str[i-1].ord - 97
    0.upto(uniq_chars-1){|j| csum[j][i] = csum[j][i-1]}
    csum[id][i] = csum[id][i-1] + 1
  end
  require 'pry'; binding.pry
  1.upto(100000){ |i| @fact_cache[i] = (i * @fact_cache[i-1]) % @mod }
end

init('abcdaabca')

def answerQuery(l, r)
  # Return the answer for this query modulo 1000000007.
  heuristics = {}
  heuristics = @str_chars[(l-1)...r].group_by(&:itself).transform_values!(&:size).to_a
  return 1 if heuristics.size == 1
  total_odds = heuristics.count{|c| c[1]%2 == 1} # No need to sum here, just one is enough
  even_arrays = heuristics.map{|c| c[1]/2}
  denominator = 1
  even_arrays.reject(&:zero?).each { |val| denominator = (denominator * @fact_cache[val]) % @mod }
  mmi = denominator.pow(@mod-2, @mod)
  total_evens = heuristics.sum { |c| c[1]/2 }
  if total_evens > 0
    return ((total_odds == 0 ? 1 : total_odds) * @fact_cache[even_arrays.sum] * mmi) % 1000000007
  elsif total_odds > 0
    return total_odds % 1000000007
  else
    0
  end
end

init('week')
puts answerQuery(1, 4) == 2
puts answerQuery(2, 3) == 1

init('abab')
puts answerQuery(1, 4) == 2

init('daadabbadcabacbcccbdcccdbcccbbaadcbabbdaaaabbbdabdbbdcadaaacaadadacddabbbbbdcccbaabbbacacddbbbcbbdbd')
puts answerQuery(81, 83) == 1
puts answerQuery(14, 17) == 2
puts answerQuery(56, 56) == 1
puts answerQuery(66, 69) == 2
puts answerQuery(17, 17) == 1
puts answerQuery(92, 93) == 1
puts answerQuery(17, 18) == 1
puts answerQuery(38, 40) == 3
puts answerQuery(100, 100) == 1
puts answerQuery(33, 36) == 4
i = 0
inputs = []
outputs = []
in_file = File.read('tin2.txt').split("\n")
out_file = File.read('tout2.txt').split("\n")
init(in_file[0])
in_file[1].to_i.times do |i|
  inputs << in_file[i+2].split(' ').map(&:to_i)
  outputs << out_file[i].to_i
end

inputs.each_with_index do |input, i|
  result = answerQuery(input[0], input[1])
  puts i
  if result != outputs[i]
    # if @str[((input[0]-1)...input[1])] == 'yqpqyqq'
      # puts "Output came: #{result}"
      # puts "#{@str[((input[0]-1)...input[1])]} #{input} #{outputs[i]}"
    # end
  end
  # puts answerQuery(input[0], input[1]) == outputs[i]
end