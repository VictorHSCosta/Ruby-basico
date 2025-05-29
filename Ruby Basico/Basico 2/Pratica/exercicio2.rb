# File.open("Arquivo/user.txt" , "w") do |file|
#   file.puts "Guardando" #adiciona quebra de linha
#   file.write "Hello world" #aqui não adiciona quebra de linha
# end


#modo melhor e mais interativo 2 mas com sobresescrita

# File.open("Arquivos/user.txt", "w") do |file|
#   puts "Quais cursos tu curte fazer ?"
#   cursos = gets.chomp
#   file.puts cursos
# end


#modo melhor sem reescrita
#
#

FILE = "Arquivos/user.txt"
$file = {:path => FILE} #trasformando em variavel global 

def nomearArquivo
  puts "Deseja usar o caminho padrão do arquivo ou quer mudar o nome (s/n)"
  opcao = gets.chomp
  if (opcao.upcase == "S")  
    puts "Digite o novo nome do arquivo que voce quer :"
      new = gets.chomp
      new = "Arquivos/#{new}"

      RenameFile(new)

      $file[:path] = new
  end
end

def bancoDeDados(dados)
  File.open("Arquivos/user.txt" , "a") do |file|
    file.puts "#user information data"
    file.write(dados)
  end
end

def RenameFile(newFile)
  File.rename($file[:path] , newFile)

  puts "Nome do arquivo mudou de #{$file} para #{newFile}"
end

def deleteFile
  if File.exist?($file[:path])
    puts "Voce tem certeza disso ? (s/n)"

    if(gets.chomp.upcase == "S")
      File.delete($file[:path])
      puts "Arquivo Deletado com sucesso"
      return
    end

    puts "Arquivo nao foi deletado"
  end
end

def initialProgram
  100.times { print "+" }
  puts
  puts "Menu inicial".center(100," ")
  100.times { print "+" }
  puts
  puts "Caminho #{$file[:path]}"
  menu = <<Text
    1 - Deseja criar um novo usuario ?
    2 - Deseja Buscar um usuario ?
    3 - Deletar todas as informações do banco de dados
    4 - Renomear o arquivo
Text
  puts menu
end

def buscador(name)
  File.open("Arquivos/user.txt" , "r") do |file|
    file.each_line { |line|
      if(line.index(name))
        puts "Usuario encontrado"
        puts line
      end
    }
  end
end

def createUser
  user = {}
  puts "Caminho #{file[:path]}"
  puts "Digite o nome do usuario"
  user[:name] = gets.chomp
  puts "Digite a idade do usuario"
  user[:age] = gets.chomp.to_i
  puts "Digite estado do usuario"
  user[:state] = gets.chomp.to_s

  user
end


