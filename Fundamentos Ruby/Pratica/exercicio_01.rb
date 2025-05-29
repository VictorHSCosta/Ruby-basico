# Constante
PI = 3.14

# Variável global
$mensagem = "Hello, world!"

# Variáveis locais
idade = 22                    # Integer
altura = 1.75                 # Float
nome = "Vitor"                # String
status = :ativo               # Symbol
aprovado = true               # Boolean (true)
cancelado = false             # Boolean (false)
vazio = nil                   # Nil
numeros = [1, 2, 3, 4, 5]      # Array
pessoa = { nome: "Vitor", idade: 22 } # Hash
intervalo = 1..10             # Range

# Impressão dos valores e tipos
puts "PI: #{PI} (#{PI.class})"
puts "Mensagem Global: #{$mensagem} (#{$mensagem.class})"
puts "Idade: #{idade} (#{idade.class})"
puts "Altura: #{altura} (#{altura.class})"
puts "Nome: #{nome} (#{nome.class})"
puts "Status: #{status} (#{status.class})"
puts "Aprovado: #{aprovado} (#{aprovado.class})"
puts "Cancelado: #{cancelado} (#{cancelado.class})"
puts "Vazio: #{vazio} (#{vazio.class})"
puts "Números: #{numeros} (#{numeros.class})"
puts "Pessoa: #{pessoa} (#{pessoa.class})"
puts "Intervalo: #{intervalo} (#{intervalo.class})"