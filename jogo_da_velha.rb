class JogoDaVelha
  def initialize
    # Cria um array de strings de "1" a "9"
    #
    @tabuleiro = ("1".."9").to_a
    @jogador_atual = "X"
  end

  def jogar
    loop do
      exibir_tabuleiro
      solicitar_jogada

      if venceu?
        exibir_tabuleiro
        puts "Fim de jogo! O jogador #{@jogador_atual} venceu!"
        break
      elsif empate?
        exibir_tabuleiro
        puts "Empate! O jogo deu velha."
        break
      end

      trocar_jogador
    end
  end

  private

  def exibir_tabuleiro
    system "clear" or system "cls"
    puts "\n"
    @tabuleiro.each_slice(3) do |linha|
      puts " #{linha.join(' | ')} "
      puts "-----------" unless linha == @tabuleiro.last(3)
    end
    puts "\n"
  end

  def solicitar_jogada
    loop do
      print "Jogador #{@jogador_atual}, escolha uma posição (1-9): "
      posicao = gets.chomp.to_i - 1

      if posicao.between?(0, 8) && @tabuleiro[posicao] != "X" && @tabuleiro[posicao] != "O"
        @tabuleiro[posicao] = @jogador_atual
        break
      else
        puts "Posição inválida ou já ocupada. Tente novamente."
      end
    end
  end

  def trocar_jogador
    @jogador_atual = @jogador_atual == "X" ? "O" : "X"
  end

  def venceu?
    combinacoes_vitoria = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # Linhas
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # Colunas
      [0, 4, 8], [2, 4, 6]             # Diagonais
    ]

    combinacoes_vitoria.any? do |a, b, c|
      @tabuleiro[a] == @tabuleiro[b] && @tabuleiro[b] == @tabuleiro[c]
    end
  end

  def empate?
    # Se não houver mais números no tabuleiro (apenas X e O), deu empate
    @tabuleiro.all? { |espaco| %w[X O].include?(espaco) }
  end
end

# Para iniciar o jogo:
jogo = JogoDaVelha.new
jogo.jogar
