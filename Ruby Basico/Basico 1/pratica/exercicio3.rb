puts "Calculadora de numeros pares e impares"
puts "Digite um numero inteiro:"

numero = gets.chomp.to_i

if numero % 2 == 0;
  puts "Seu numero é par"
else
  puts "Seu numero é impar"
end