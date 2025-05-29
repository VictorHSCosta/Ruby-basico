
# Aula: Módulo URI em Ruby

## O que é o módulo `URI`?

O módulo `URI` em Ruby fornece um conjunto de classes para manipular URLs e URIs de forma estruturada. Com ele, você pode **parsear**, **construir** e **manipular** URIs facilmente.

Exemplo de URI:
```
https://www.exemplo.com:443/pagina?busca=ruby#ancora
```

## Requerendo o módulo

```ruby
require 'uri'
```

## Parseando uma URI

```ruby
require 'uri'

uri = URI.parse("https://www.exemplo.com:443/pagina?busca=ruby#ancora")
puts uri.scheme    # => "https"
puts uri.host      # => "www.exemplo.com"
puts uri.port      # => 443
puts uri.path      # => "/pagina"
puts uri.query     # => "busca=ruby"
puts uri.fragment  # => "ancora"
```

## Construindo uma URI

```ruby
require 'uri'

uri = URI::HTTPS.build(
  host: 'www.exemplo.com',
  path: '/busca',
  query: URI.encode_www_form({ busca: 'ruby', page: 2 })
)

puts uri.to_s  # => "https://www.exemplo.com/busca?busca=ruby&page=2"
```

## Codificando e decodificando parâmetros

### Codificar

```ruby
require 'uri'

params = { busca: 'ruby e rails', ordem: 'asc' }
puts URI.encode_www_form(params)
# => "busca=ruby+e+rails&ordem=asc"
```

### Decodificar

```ruby
require 'uri'

query = "busca=ruby+e+rails&ordem=asc"
puts URI.decode_www_form(query).to_h
# => {"busca"=>"ruby e rails", "ordem"=>"asc"}
```

## Validando uma URI

```ruby
require 'uri'

def uri_valida?(string)
  uri = URI.parse(string)
  %w(http https).include?(uri.scheme)
rescue URI::InvalidURIError
  false
end

puts uri_valida?("https://meusite.com")  # => true
puts uri_valida?("nota_url")             # => false
```

## Conclusão

- O módulo `URI` ajuda a trabalhar com URLs e URIs de forma estruturada.
- Permite parsear, construir, codificar e decodificar URIs.
- Útil para APIs, web scraping, integração com serviços externos e mais.