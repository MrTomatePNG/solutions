# Implementar um método #stock_pickerque leva em uma série de preços
# de ações, um para cada dia hipotético. Deve devolver um par de dias
# representando o melhor dia para comprar e o melhor dia para vender.
# Os dias começam em 0.

# @param prices [Array<Integer>]
# @return [Array<Integer>]
def stock_picker(prices)
  best_days = [0, 0]
  max_profit = 0

  prices.each_with_index do |buy_price, buy_day|
    prices[(buy_day + 1)..].each_with_index do |sell_price, offset|
      pp "offset: #{offset}"
      sell_day = buy_day + offset + 1
      profit = sell_price - buy_price

      # Pula direto pra proxima interação da iteração
      # se o lucro nao for maior que o maximo estabelecido
      next unless profit > max_profit

      # novo maximo
      max_profit = profit
      # marca
      best_days = [buy_day, sell_day]
      p "Melhor <Compra> : #{best_days[0]} Melhor<Venda> : #{best_days[1]}"
      pp "melhor profit #{max_profit}"
      pp "MelhoresDias: #{best_days}"
    end
  end
  best_days
end

# @param prices [Array<Integer>]
def stock_price_one(prices)
  return [0, 0] if prices.empty?

  min_price = prices[0]
  min_day = 0

  max_profit = 0
  best_days = [0, 0]

  prices.each_with_index do |current_price, current_day|
    if current_price < min_price
      min_price = current_price
      min_day = current_day
    end
    current_profit = current_price - min_price

    if current_profit > max_profit
      max_profit = current_profit
      best_days = [min_day, current_day]
    end
  end
  best_days
end

p(stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10]) == stock_price_one([17, 3, 6, 9, 15, 8, 6, 1, 10]))
