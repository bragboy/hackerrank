# rubocop:disable all

def record_letter(count, letter1, letter2)
  count[letter1] = count[letter1] ? count[letter1] + 1 : 1
  count[letter2] = count[letter2] ? count[letter2] + 1 : 1
  count
end

def find_word(rules)
  one_chars = rules.map{|r| [r[0],r[2]]}.flatten.group_by(&:itself).to_a.select{|c| c[1] if c[1].size == 1}.flatten.uniq
  init = rules.detect{|r| one_chars.include?(r[0])}
  out, next_c = init[0]+init[2], init[2]
  loop { next_c = rules.detect{|r| r[0] == next_c}[2] rescue break; out += next_c }
  out
end

def find_words(rules)
  len = rules.length
  first_letters = []
  last_letters = []
  current_index = 0
  count = {}

  while current_index < len
    first_letters.push(rules[current_index][0])
    last_letters.push(rules[current_index][2])

    record_letter(count, rules[current_index][0], rules[current_index][2])
    current_index += 1
  end

  first = ''
  count.keys.each do |k|
    first = k if count[k] == 1 && first_letters.include?(k)
  end

  result = first
  current_index = first_letters.index(first)
  times = 0
  while times < len
    result += last_letters[current_index]
    current_index = first_letters.index(last_letters[current_index])

    times += 1
  end

  puts result
  result
end

puts find_word(['P>E', 'E>R', 'R>U']) == 'PERU'
puts find_word(['I>N', 'A>I', 'P>A', 'S>P']) == 'SPAIN'
puts find_word(['U>N', 'G>A', 'R>Y', 'H>U', 'N>G', 'A>R']) == 'HUNGARY'
puts find_word(['I>F', 'W>I', 'S>W', 'F>T']) == 'SWIFT'
puts find_word(['R>T', 'A>L', 'P>O', 'O>R', 'G>A', 'T>U', 'U>G']) == 'PORTUGAL'
puts find_word(['U>N', 'G>A', 'R>Y', 'H>U', 'N>G', 'A>R']) == 'HUNGARY'
puts find_word(['I>F', 'W>I', 'S>W', 'F>T']) == 'SWIFT'
puts find_word(['R>T', 'A>L', 'P>O', 'O>R', 'G>A', 'T>U', 'U>G']) == 'PORTUGAL'
puts find_word(['W>I', 'R>L', 'T>Z', 'Z>E', 'S>W', 'E>R', 'L>A', 'A>N', 'N>D', 'I>T']) == 'SWITZERLAND'
