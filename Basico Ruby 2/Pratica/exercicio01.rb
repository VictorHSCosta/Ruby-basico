# primeiro modo 

movies = File.open("Arquivos/leitura.txt")

puts movies


movies.each do |line|
  puts line
end


# segundo modo
# 
path = "Arquivos/leitura.txt"
File.open(path , "r") do |file|
  file.each_line { |line| puts line.strip unless line.strip.empty?}
end