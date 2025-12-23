class MasterMind
  def initialize
    @codigo_secreto = gerar_codigo_secreto
    @tentativas = 10
  end

  def gerar_codigo_secreto
    cores = %w[R G B Y O P]
    Array.new(4) { cores.sample }
  end

  def jogar
    puts "Bem-vindo ao MasterMind!"
    puts "Cores disponíveis: R (Red), G (Green), B (Blue), Y (Yellow), O (Orange), P (Purple)"
    puts "Tente adivinhar o código secreto de 4 cores. Você tem #{@tentativas} tentativas."

    while @tentativas.positive?
      print "Digite sua tentativa (ex: RGBY): "
      tentativa = gets.chomp.upcase.chars

      if tentativa.length != 4 || tentativa.any? { |cor| !%w[R G B Y O P].include?(cor) }
        puts "Entrada inválida. Certifique-se de digitar 4 cores válidas."
        next
      end

      if tentativa == @codigo_secreto
        puts "Parabéns! Você adivinhou o código secreto: #{@codigo_secreto.join}"
        return
      end

      feedback = fornecer_feedback(tentativa)
      @tentativas -= 1
      puts "Feedback: #{feedback[:corretas]} cores corretas na posição correta, #{feedback[:presentes]} cores corretas na posição errada."
      puts "Tentativas restantes: #{@tentativas}"
    end

    puts "Você esgotou suas tentativas! O código secreto era: #{@codigo_secreto.join}"

  end

  def fornecer_feedback(tentativa)
    corretas = 0
    presentes = 0
    codigo_temp = @codigo_secreto.dup
    tentativa_temp = tentativa.dup

    # Verificar cores corretas na posição correta
    tentativa_temp.each_with_index do |cor, index|
      next unless cor == codigo_temp[index]

      corretas += 1
      codigo_temp[index] = nil
      tentativa_temp[index] = index
    end

    # Verificar cores corretas na posição errada
    tentativa_temp.compact.each do |cor|
      if codigo_temp.include?(cor)
        presentes += 1
        codigo_temp[codigo_temp.index(cor)] = nil
      end
    end

    { corretas: corretas, presentes: presentes }
  end

  def self.iniciar_jogo
    jogo = MasterMind.new
    jogo.jogar
  end

end

MasterMind.iniciar_jogo
