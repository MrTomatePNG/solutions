# Criar um método bubble_sortque
# recebe um array e retorna um array ordenado.
# Deve usar o método de ordenação por bolha
# (usando #sortSeria bastante inútil, não é?)

# @param list [Array<Integer>]
# @return [Array<Integer>]
def bubble_sort(list)
  n = list.length

  loop do
    swapped = false
    (n - 1 ).times do |i|
      if list[i] > list[i + 1]
        list[i], list[i + 1] = list[i + 1], list[i]
        swapped = true
      end
    end
    break unless swapped
  end
  list
end

puts bubble_sort([4,3,7,8,2,0,2])
