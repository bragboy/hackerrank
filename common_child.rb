# https://www.hackerrank.com/challenges/common-child/problem
# Category: Strings
# Difficulty: Medium
# Success Rate: 56.93%
# Score: 60
# Algorithm: Dynamic Programming | Bottom-up | Longest Common Subsequence problem

def commonChild(s1, s2)
end

# Recursive solution
def lcs(s1, s2, i, j)
  result = 0
  if i<=0 || j<=0
    result = 0
  elsif s1[i-1] == s2[j-1]
    result = 1 + lcs(s1, s2, i-1, j-1)
  else
    result = [lcs(s1, s2, i-1, j), lcs(s1, s2, i, j-1)].max
  end
  @dp[[i, j]] = result
  result
end

puts commonChild('HARRY', 'SALLY') # == 2
puts commonChild('AA', 'BB') # == 0
puts commonChild('SHINCHAN', 'NOHARAAA') # == 3
puts commonChild('ABCDEF', 'FBDAMN') # == 2
# puts commonChild('A', 'B') # == 0
# puts commonChild('', '') # == 0