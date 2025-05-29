def sqrt(number)
  if(number < 0)
    number *= -1
    number = Math.sqrt(number)
    puts "A raiz quadrada é #{number}i"
    return
  end
  puts "A raiz quadrada é #{Math.sqrt(number)}"
end


sqrt(10)

sqrt(-10)
  