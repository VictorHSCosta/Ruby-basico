require "uri"
require "net/http"
require 'csv'
require 'json'

path = "/home/victor/Documentos/Estudo Ruby/Basico Ruby 2/Pratica/Arquivos"

url = URI.parse("http://www.omdbapi.com/?s=matrix&apikey=thewdb")

http = Net::HTTP.new(url.host , url.port)

http.use_ssl = (url.scheme == 'https')

request = Net::HTTP::Get.new(url)
response = http.request(request)

if response.is_a?(Net::HTTPSuccess)
  # Converte a resposta para JSON
  data = JSON.parse(response.body)
  
  CSV.open("#{path}/filmes.csv","w") do |csv|
    csv << ["Título" , "Ano" ,"Tipo"]
    if data["Search"]
      data["Search"].each do |movie|
        csv << ["#{movie['Title']}","#{movie['Year']}","#{movie['Type']}"]
      end
    end
  end
end