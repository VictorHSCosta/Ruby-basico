
# Aula: Trabalhando com CSV em Ruby

## O que é um CSV?

CSV significa **Comma-Separated Values** (valores separados por vírgula). É um formato simples para armazenar dados tabulares (como planilhas), onde cada linha representa um registro e os valores são separados por vírgulas.

Exemplo de conteúdo de um arquivo `.csv`:

```
nome,idade,email
Alice,30,alice@email.com
Bob,25,bob@email.com
```

## Por que usar CSV?

- É leve e fácil de ler.
- Compatível com Excel, Google Sheets e bancos de dados.
- Muito usado para importação/exportação de dados.

## Lendo arquivos CSV em Ruby

Ruby tem uma biblioteca padrão chamada `CSV`. Basta dar require:

```ruby
require 'csv'

CSV.foreach("dados.csv", headers: true) do |linha|
  puts "Nome: #{linha['nome']}, Idade: #{linha['idade']}"
end
```

## Escrevendo arquivos CSV

```ruby
require 'csv'

CSV.open("saida.csv", "w") do |csv|
  csv << ["nome", "idade", "email"]
  csv << ["Carol", 29, "carol@email.com"]
  csv << ["David", 35, "david@email.com"]
end
```

## Lendo CSV como array de hashes

```ruby
require 'csv'

dados = CSV.read("dados.csv", headers: true, header_converters: :symbol)
dados.each do |linha|
  puts linha[:nome]
end
```

## Gerando CSV a partir de arrays

```ruby
require 'csv'

dados = [
  ["Produto", "Preço"],
  ["Teclado", "100"],
  ["Mouse", "50"]
]

CSV.generate do |csv|
  dados.each do |linha|
    csv << linha
  end
end
```

## Lidando com delimitadores diferentes

Às vezes, o CSV usa ponto e vírgula (`;`) em vez de vírgula. Nesse caso:

```ruby
CSV.foreach("dados.csv", col_sep: ";", headers: true) do |linha|
  puts linha["nome"]
end
```

## Conclusão

- CSV é um formato simples, ótimo para dados tabulares.
- Ruby possui suporte nativo via a biblioteca `CSV`.
- Você pode ler, escrever, e manipular dados com facilidade.