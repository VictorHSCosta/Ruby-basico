# Entendendo `gets` e `chomp` no Ruby

## 1. O que é `gets`?

- `gets` é um **método** que **lê uma linha de entrada** do teclado.
- Quando você usa `gets`, o programa **espera** o usuário digitar algo e apertar `Enter`.
- O que for digitado é capturado como uma **String** (texto), **sempre com uma quebra de linha** (`\n`) no final.

### Exemplo:
```ruby
puts "Digite seu nome:"
nome = gets
puts "Olá, #{nome}!"
Se você digitar Vitor e apertar Enter, o programa vai imprimir: Olá, Vitor\n! (Observe que o \n é o "Enter" capturado junto.)

```

2. O que é chomp?
O método chomp é usado para remover a quebra de linha (\n) do final da string que foi lida com gets.

Assim, o texto fica "limpo", sem o Enter atrapalhando a saída do programa.

Exemplo usando chomp:
```
puts "Digite seu nome:"
nome = gets.chomp
puts "Olá, #{nome}!"
```
Agora, se você digitar Vitor e apertar Enter, o programa vai imprimir certinho: Olá, Vitor!

3. Resumo Rápido

Método	Função
gets	Lê uma linha do teclado, incluindo o Enter (\n) no final
chomp	Remove o Enter (\n) da string lida com gets
4. Exemplo Completo
```
puts "Qual é o seu nome?"
nome = gets.chomp

puts "Qual é a sua idade?"
idade = gets.chomp

puts "Seja bem-vindo, #{nome}! Você tem #{idade} anos."

```
Exemplo de funcionamento:

```
Qual é o seu nome?
Vitor
Qual é a sua idade?
22
Seja bem-vindo, Vitor! Você tem 22 anos.

```

5. Dica Extra
Sempre que usar gets, é recomendado usar .chomp junto para evitar problemas com quebras de linha.

Se quiser transformar o que o usuário digitou em número, você pode usar:

.to_i para transformar em número inteiro

.to_f para transformar em número decimal (ponto flutuante)

Exemplo de conversão:
```
puts "Digite um número:"
numero = gets.chomp.to_i
puts "O dobro do número é #{numero * 2}"

```

6. Exercício Proposto
Crie um programa chamado entrada_usuario.rb que:

Pergunte o nome do usuário

Pergunte a idade do usuário

Pergunte a altura do usuário

Pergunte se ele está estudando (responda com sim ou não)

Mostre uma mensagem final resumindo todas essas informações
