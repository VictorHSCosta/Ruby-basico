# usando funcoes que é um conteudo nao visto ainda
# 

puts "Digite um numero e descubra se esse numero é primo ou nao"
 
number = gets.chomp.to_i()

def primo(number , interacao = number ,count = 0)
  puts "iteracao numero #{count} e o numero é #{number}"

  if(interacao == 0)
    if(count > 2)
      return false
    end
    return true
  end

  puts "Esse é o resultado de #{number} / #{interacao} = #{(number/(interacao).to_f)} e esse é outro #{number % (interacao)}"

  if(number % interacao == 0)
    count += 1
  end

  primo(number ,interacao - 1 , count)
end

if(primo(number))
  puts "Esse numero é primo"
else
  puts "Esse numero nao é primo"
end


