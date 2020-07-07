# rubocop:disable all

def isValid(s)
  freq_hash = s.split('').group_by(&:itself).values.map(&:size).group_by(&:itself)
  return 'NO' if freq_hash.keys.size > 2
  return 'YES' if freq_hash.keys.size == 1
  if freq_hash.keys.size == 2
    return 'YES' if freq_hash[1] == 1
    if freq_hash[freq_hash.keys.first].size < freq_hash[freq_hash.keys.last].size
      lower_freq_key = freq_hash.keys.first
    else
      lower_freq_key = freq_hash.keys.last
    end
    lower_freq_value = freq_hash[lower_freq_key]

    return 'YES' if ((freq_hash.keys.first - freq_hash.keys.last).abs == 1 || lower_freq_key == 1 ) && lower_freq_value.size == 1
  end
  'NO'
end

puts isValid('aabbcd')
puts isValid('aabbccddeefghi')
puts isValid('abcdefghhgfedecba')
puts isValid('aabbccddee')
puts isValid('ibfdgaeadiaefgbhbdghhhbgdfgeiccbiehhfcggchgghadhdhagfbahhddgghbdehidbibaeaagaeeigffcebfbaieggabcfbiiedcabfihchdfabifahcbhagccbdfifhghcadfiadeeaheeddddiecaicbgigccageicehfdhdgafaddhffadigfhhcaedcedecafeacbdacgfgfeeibgaiffdehigebhhehiaahfidibccdcdagifgaihacihadecgifihbebffebdfbchbgigeccahgihbcbcaggebaaafgfedbfgagfediddghdgbgehhhifhgcedechahidcbchebheihaadbbbiaiccededchdagfhccfdefigfibifabeiaccghcegfbcghaefifbachebaacbhbfgfddeceababbacgffbagidebeadfihaefefegbghgddbbgddeehgfbhafbccidebgehifafgbghafacgfdccgifdcbbbidfifhdaibgigebigaedeaaiadegfefbhacgddhchgcbgcaeaieiegiffchbgbebgbehbbfcebciiagacaiechdigbgbghefcahgbhfibhedaeeiffebdiabcifgccdefabccdghehfibfiifdaicfedagahhdcbhbicdgibgcedieihcichadgchgbdcdagaihebbabhibcihicadgadfcihdheefbhffiageddhgahaidfdhhdbgciiaciegchiiebfbcbhaeagccfhbfhaddagnfieihghfbaggiffbbfbecgaiiidccdceadbbdfgigibgcgchafccdchgifdeieicbaididhfcfdedbhaadedfageigfdehgcdaecaebebebfcieaecfagfdieaefdiedbcadchabhebgehiidfcgahcdhcdhgchhiiheffiifeegcfdgbdeffhgeghdfhbfbifgidcafbfcd')
puts isValid('aaaaabc')