# Implementar um método substrings que toma uma palavra como o primeiro argumento e,
# em seguida, uma matriz de substrings válidos (seu dicionário) como o segundo argumento.
# Ele deve retornar uma lista de hash cada substring (caso insensível)
# que foi encontrado na cadeia original e quantas vezes foi encontrado.

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

def substrings(word, dict)
  count = Hash.new 0
  dict.each do |s|
    matches =  word.scan(s.downcase).length
    count[s] = matches unless matches.zero?
  end
  count
end

puts substrings("belowlow", dictionary)
