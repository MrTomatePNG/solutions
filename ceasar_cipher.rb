

def ceasar_cipher(word,shift)
  encrypted_word = ""
  word.each_char do |char|
    if char =~ /[A-Za-z]/
      base = char.ord < 91 ? 'A'.ord : 'a'.ord
      shifted_char = ((char.ord - base + shift) % 26) + base
      encrypted_word += shifted_char.chr
    else
      encrypted_word += char
    end
  end
  encrypted_word
end
