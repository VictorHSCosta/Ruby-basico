def searchFile(word)
  resposta = []

  path = "/home/victor/Documentos/Estudo Ruby/ Basico Ruby 2/Pratica/Arquivos"
    
  Dir.glob("#{path}/*.txt") do |file_name|
    readed_file = File.open(file_name,"r")

    readed_file.each_with_index do |line, index|
      if line.include?(word)
        resposta << [index + 1, file_name]
      end
    end

    readed_file.close
  end

  resposta
end

word = ARGV[0]

resposta = searchFile(word) if !word.nil?

puts "Encontrado #{resposta.length} ocorrencias da palavra #{word}"

if !resposta.empty?
  resposta.each do |line|
    puts "No arquivo #{line[1]} foi encontrado na linha #{line[0]}"
  end
end