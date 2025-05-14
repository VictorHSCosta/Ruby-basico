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