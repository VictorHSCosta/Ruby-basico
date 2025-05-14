# Aula: Módulos em Ruby

## O que é um módulo?

Em Ruby, **módulos** (ou *modules*) são uma forma de agrupar métodos, constantes e classes relacionadas. Eles ajudam a organizar o código e evitar conflitos de nomes, funcionando também como *namespaces*.

Eles são úteis principalmente para:
- Reutilização de código (Mixin).
- Organização lógica do sistema.
- Evitar conflitos de nomes.

## Como criar um módulo

```ruby
module Saudacao
  def diga_ola
    puts "Olá!"
  end

  def diga_ate_logo
    puts "Até logo!"
  end
end
```

## Como usar um módulo (Mixin)

Você pode usar um módulo de duas formas:

### 1. `include` – inclui os métodos como métodos de instância

```ruby
class Pessoa
  include Saudacao
end

p = Pessoa.new
p.diga_ola       # => "Olá!"
p.diga_ate_logo  # => "Até logo!"
```

### 2. `extend` – inclui os métodos como métodos de classe

```ruby
class Robo
  extend Saudacao
end

Robo.diga_ola       # => "Olá!"
Robo.diga_ate_logo  # => "Até logo!"
```

## Namespaces com módulos

Módulos também podem agrupar várias classes e constantes:

```ruby
module Pagamento
  TAXA = 0.05

  class Boleto
    def pagar
      puts "Pagando com boleto"
    end
  end

  class Cartao
    def pagar
      puts "Pagando com cartão"
    end
  end
end

b = Pagamento::Boleto.new
b.pagar
puts Pagamento::TAXA
```

## Módulos aninhados

Você pode criar módulos dentro de outros módulos:

```ruby
module Sistema
  module Autenticacao
    def login
      puts "Usuário logado!"
    end
  end
end

class Usuario
  include Sistema::Autenticacao
end

u = Usuario.new
u.login
```

## Conclusão

- Use `module` para agrupar métodos relacionados.
- `include` adiciona métodos como instância.
- `extend` adiciona métodos como métodos de classe.
- Módulos ajudam a manter o código organizado e reutilizável.


# Aula: Instalando Gems no Ruby

## O que é uma Gem?

Gems são bibliotecas ou pacotes reutilizáveis de código Ruby. Elas servem para adicionar funcionalidades ao seu projeto sem que você precise programar tudo do zero. Por exemplo, a gem `rails` traz toda a estrutura do framework Ruby on Rails.

## Pré-requisitos

- Ter o Ruby instalado no seu sistema (verifique com `ruby -v`)
- Ter o RubyGems instalado (já vem por padrão com o Ruby moderno)

---

## 1. Verificando se o RubyGems está instalado

```bash
gem -v
```

Se aparecer uma versão, está tudo certo.

---

## 2. Instalando uma gem

Para instalar uma gem:

```bash
gem install nome_da_gem
```

### Exemplo:

```bash
gem install nokogiri
```

Isso instalará a gem `nokogiri`, usada para manipular HTML/XML.

Você pode adicionar a opção `--no-document` para evitar instalar a documentação:

```bash
gem install nokogiri --no-document
```

---

## 3. Usando uma gem no seu código

Depois de instalada, basta usar `require` para carregá-la:

```ruby
require 'nokogiri'
```

---

## 4. Instalando gems em projetos com Bundler

Para projetos com múltiplas dependências, usamos o `Bundler`. Ele gerencia as gems através de um arquivo chamado `Gemfile`.

### Passos:

1. Instale o Bundler (se necessário):

```bash
gem install bundler
```

2. Crie um `Gemfile`:

```ruby
# Gemfile
source 'https://rubygems.org'

gem 'nokogiri'
gem 'rails'
```

3. Instale as gems do Gemfile:

```bash
bundle install
```

4. Carregue as gems no seu código:

```ruby
require 'bundler/setup'
Bundler.require(:default)
```

---

## 5. Atualizando gems

```bash
gem update nome_da_gem
```

Ou todas:

```bash
gem update
```

---

## 6. Verificando gems instaladas

```bash
gem list
```

---

## 7. Removendo uma gem

```bash
gem uninstall nome_da_gem
```

---

## Dica: Site para procurar gems

Acesse [https://rubygems.org](https://rubygems.org) para buscar gems, versões e documentações.

---

## Conclusão

Instalar gems no Ruby é essencial para ganhar produtividade e reaproveitar código da comunidade. Use sempre o Bundler para projetos maiores, e mantenha suas gems atualizadas!

---

**Próxima aula sugerida:** Como criar sua própria gem em Ruby 🚀

