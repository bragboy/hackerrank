# https://www.hackerrank.com/challenges/queens-attack-2/problem

def queensAttack(n, k, r_q, c_q, obstacles)
  s_obs = []

  # Add out of bounds Straight obs
  s_obs << [0, c_q]
  s_obs << [n+1, c_q]
  s_obs << [r_q, 0]
  s_obs << [r_q, n+1]

  # Left bottom
  s_obs << (c_q >= r_q ? [0, c_q - r_q] : [r_q - c_q, 0])

  # Right Top
  s_obs << (r_q >= c_q ? [n+1, c_q + n + 1 - r_q] : [r_q + n + 1 - c_q, n+1])

  # Right Bottom
  if r_q + c_q <= n
    s_obs << [0, c_q + r_q]
  else
    s_obs << [r_q - (n + 1 - c_q), n + 1 ]
  end

  # Left Top
  if r_q + c_q <= n
    s_obs << [c_q + r_q, 0]
  else
    s_obs << [n + 1, c_q - (n + 1 - r_q)]
  end

  obstacles += s_obs

  right_obs, left_obs, top_obs, bottom_obs = [], [], [], []
  right_top_obs, right_bottom_obs, left_top_obs, left_bottom_obs = [], [], [], []

  obstacles.each do |obs|
    right_obs << obs if obs[0] == r_q && obs[1] > c_q
    left_obs << obs if obs[0] == r_q && obs[1] < c_q
    top_obs << obs if obs[1] == c_q && obs[0] > r_q
    bottom_obs << obs if obs[1] == c_q && obs[0] < r_q

    right_top_obs << obs if r_q - c_q == (obs[0] - obs[1]) && obs[0] > r_q && obs[1] > c_q
    left_bottom_obs << obs if r_q - c_q == (obs[0] - obs[1]) && obs[0] < r_q && obs[1] < c_q
    
    left_top_obs << obs if r_q + c_q == (obs[0] + obs[1]) && obs[0] > r_q && obs[1] < c_q
    right_bottom_obs << obs if r_q + c_q == (obs[0] + obs[1]) && obs[0] < r_q && obs[1] > c_q
  end

  spaces = 0
  spaces += right_obs.map{|c| c[1]}.min - c_q - 1
  spaces += c_q - left_obs.map{|c| c[1]}.max - 1
  spaces += top_obs.map{|c| c[0]}.min - r_q - 1
  spaces += r_q - bottom_obs.map{|c| c[0]}.max - 1
  
  spaces += right_top_obs.map{|c| c[1]}.min - c_q - 1
  spaces += right_bottom_obs.map{|c| c[1]}.min - c_q - 1
  spaces += c_q - left_top_obs.map{|c| c[1]}.max - 1
  spaces += c_q - left_bottom_obs.map{|c| c[1]}.max - 1

  spaces
end

puts queensAttack(4, 0, 4, 4, []) # 9
puts queensAttack(5, 3, 4, 3, [[5, 5], [4, 2], [2, 3]]) # 10
puts queensAttack(1, 0, 1, 1, []) # 0
puts queensAttack(100000, 0, 4187, 5068, []) # 308369
