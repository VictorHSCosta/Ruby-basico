# Trabalhando com Operadores Aritméticos e Relacionais em Ruby

Vamos aprender dois conceitos fundamentais para qualquer linguagem de programação — **operadores aritméticos** e **operadores relacionais** — usando **Ruby**, que é uma linguagem muito amigável e fácil de entender.

## O que são Operadores Aritméticos?

Os operadores aritméticos são usados para **realizar operações matemáticas** básicas, como somar, subtrair, multiplicar e dividir números.

Em Ruby, os principais operadores aritméticos são:

| Operador | Nome         | Exemplo em Ruby  | Resultado |
|:--------:|:-------------|:-----------------|:---------:|
| `+`      | Adição        | `2 + 3`           | `5`       |
| `-`      | Subtração     | `5 - 2`           | `3`       |
| `*`      | Multiplicação | `4 * 2`           | `8`       |
| `/`      | Divisão       | `10 / 2`          | `5`       |
| `%`      | Módulo (resto da divisão) | `7 % 3` | `1`       |

### Explicação rápida de cada um:

- **Adição (`+`)**: soma dois valores.
- **Subtração (`-`)**: subtrai um valor do outro.
- **Multiplicação (`*`)**: multiplica dois valores.
- **Divisão (`/`)**: divide um valor pelo outro.
- **Módulo (`%`)**: devolve o **resto** da divisão entre dois valores.

> **Exemplo:**  
> `7 % 3` faz 7 dividido por 3, que dá 2 (6) e sobra **1**. O módulo retorna essa sobra.

---

## O que são Operadores Relacionais?

Os operadores relacionais são usados para **comparar valores**. Eles respondem uma pergunta como "um valor é igual ao outro?", "um valor é maior que o outro?", etc.

Eles **sempre retornam** um **valor booleano**: `true` (verdadeiro) ou `false` (falso).

Aqui estão os principais operadores relacionais em Ruby:

| Operador | Significado               | Exemplo em Ruby  | Resultado  |
|:--------:|:---------------------------|:-----------------|:----------:|
| `==`     | Igualdade                   | `5 == 5`          | `true`     |
| `!=`     | Diferente                   | `5 != 4`          | `true`     |
| `>`      | Maior que                   | `6 > 4`           | `true`     |
| `<`      | Menor que                   | `3 < 8`           | `true`     |
| `>=`     | Maior ou igual a             | `5 >= 5`          | `true`     |
| `<=`     | Menor ou igual a             | `4 <= 4`          | `true`     |

### Explicação rápida:

- **Igualdade (`==`)**: verifica se os valores são iguais.
- **Diferença (`!=`)**: verifica se os valores são diferentes.
- **Maior que (`>`)**: verifica se o valor da esquerda é maior.
- **Menor que (`<`)**: verifica se o valor da esquerda é menor.
- **Maior ou igual (`>=`)**: maior ou igual.
- **Menor ou igual (`<=`)**: menor ou igual.

> **Importante:**  
> Em Ruby, `=` é **atribuição** (guardar valor). Para comparar, usamos `==`.

---

## Exemplo Prático: Calculadora Simples em Ruby

Vamos juntar o que aprendemos e fazer um pequeno programa que usa **operadores aritméticos** e depois usa **operadores relacionais** para comparar os resultados!

```ruby
puts "Digite o primeiro número:"
num1 = gets.chomp.to_f

puts "Digite o segundo número:"
num2 = gets.chomp.to_f

# Operações aritméticas
soma = num1 + num2
subtracao = num1 - num2
multiplicacao = num1 * num2
divisao = num1 / num2
modulo = num1 % num2

puts "\nResultados das operações:"
puts "Soma: #{soma}"
puts "Subtração: #{subtracao}"
puts "Multiplicação: #{multiplicacao}"
puts "Divisão: #{divisao}"
puts "Módulo: #{modulo}"

# Operações relacionais
puts "\nComparações:"
puts "#{num1} é igual a #{num2}? #{num1 == num2}"
puts "#{num1} é diferente de #{num2}? #{num1 != num2}"
puts "#{num1} é maior que #{num2}? #{num1 > num2}"
puts "#{num1} é menor que #{num2}? #{num1 < num2}"
puts "#{num1} é maior ou igual a #{num2}? #{num1 >= num2}"
puts "#{num1} é menor ou igual a #{num2}? #{num1 <= num2}"