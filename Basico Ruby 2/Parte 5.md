
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
