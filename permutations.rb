def permute_out(str)
  permute(str, 0, str.size-1)
end

def permute(str, l, r) # Classic Recursion tree
  if l==r
    puts str
  else
    l.upto(r) do |i|
      str[l], str[i] = str[i], str[l] 
      permute(str, l+1, r)
      str[l], str[i] = str[i], str[l]
    end
  end
end

permute_out('-+/*')
