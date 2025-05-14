
# Aula: Módulo JSON em Ruby

## O que é o módulo `JSON`?

O módulo `JSON` em Ruby permite **converter objetos Ruby em JSON** e **analisar strings JSON em objetos Ruby**.

JSON (JavaScript Object Notation) é um formato leve de troca de dados, usado amplamente em APIs e sistemas web.

## Requerendo o módulo

```ruby
require 'json'
```

## Convertendo Ruby para JSON

```ruby
require 'json'

pessoa = { nome: "Victor", idade: 22 }
json = pessoa.to_json
puts json
# => "{"nome":"Victor","idade":22}"
```

## Convertendo JSON para Ruby

```ruby
require 'json'

json = '{ "nome": "Victor", "idade": 22 }'
hash = JSON.parse(json)
puts hash["nome"]  # => "Victor"
```

## Convertendo arrays

```ruby
require 'json'

lista = [1, 2, 3, 4]
json = lista.to_json
puts json           # => "[1,2,3,4]"

ruby_array = JSON.parse(json)
puts ruby_array[2]  # => 3
```

## Convertendo objetos mais complexos

```ruby
require 'json'

dados = {
  usuario: {
    nome: "Ana",
    habilidades: ["Ruby", "Rails", "React"]
  }
}

json = dados.to_json
puts json

obj = JSON.parse(json)
puts obj["usuario"]["habilidades"].join(", ")
```

## Salvando e lendo JSON em arquivos

### Salvando

```ruby
require 'json'

dados = { nome: "João", idade: 28 }

File.open("usuario.json", "w") do |arquivo|
  arquivo.write(dados.to_json)
end
```

### Lendo

```ruby
require 'json'

conteudo = File.read("usuario.json")
usuario = JSON.parse(conteudo)
puts usuario["nome"]
```

## Opções extras

### Indentação bonita (pretty print)

```ruby
require 'json'

puts JSON.pretty_generate({ nome: "Laura", idade: 30 })
```

## Conclusão

- Use `to_json` para gerar JSON a partir de objetos Ruby.
- Use `JSON.parse` para ler strings JSON.
- JSON é essencial para integração com APIs e armazenamento de dados.