# 🧠 Aula Parte 1: Fundamentos de Classes em Ruby

## 🚀 Objetivo

- Entender como declarar e usar classes em Ruby
- Compreender como funcionam os construtores, variáveis de instância e métodos
- Preparar a base para a Parte 2 (attr_reader, writer, accessor e níveis de acesso)

---

## 📦 O que é uma Classe?

Uma **classe** é um molde que descreve como criar objetos com **propriedades** (variáveis) e **comportamentos** (métodos). Ruby é uma linguagem **orientada a objetos**, então tudo gira em torno de objetos e classes.

---

## 🛠 Como Criar uma Classe

```ruby
class Pessoa
  # corpo da classe
end
```

O nome da classe deve começar com **letra maiúscula** (convenção em Ruby).

---

## 👶 Construtor (`initialize`)

Toda vez que usamos `Pessoa.new`, o método `initialize` é chamado automaticamente.

```ruby
class Pessoa
  def initialize(nome, idade)
    @nome = nome
    @idade = idade
  end
end

p = Pessoa.new("Vitor", 22)
```

### 🔍 O que é `@`?

É uma **variável de instância**. Cada objeto criado tem a **sua própria cópia** dessas variáveis.

---

## 🗣 Criando Métodos

```ruby
class Pessoa
  def initialize(nome)
    @nome = nome
  end

  def saudacao
    "Olá, meu nome é #{@nome}!"
  end
end

p = Pessoa.new("Ana")
puts p.saudacao # => "Olá, meu nome é Ana!"
```

---

## 🧠 Diferença entre Variável Local, de Instância e de Classe

| Tipo                | Prefixo | Escopo                        |
|---------------------|--------|-------------------------------|
| Local               | (nenhum) | Dentro do método              |
| Instância           | `@`    | Dentro do objeto              |
| Classe              | `@@`   | Compartilhada entre instâncias|

```ruby
class Exemplo
  @@contador = 0

  def initialize
    @@contador += 1
  end

  def self.total
    @@contador
  end
end

3.times { Exemplo.new }
puts Exemplo.total # => 3
```

---

## 🧱 Métodos de Classe vs Métodos de Instância

### Método de instância: age sobre UM objeto

```ruby
class Produto
  def descricao
    "Produto genérico"
  end
end

p = Produto.new
puts p.descricao # => "Produto genérico"
```

### Método de classe: age sobre a CLASSE

```ruby
class Produto
  def self.tipo
    "Eletrônico"
  end
end

puts Produto.tipo # => "Eletrônico"
```

---

## 🔁 Herança

Em Ruby, usamos `<` para herdar outra classe:

```ruby
class Animal
  def falar
    "Algum som"
  end
end

class Cachorro < Animal
  def falar
    "Au au"
  end
end

puts Cachorro.new.falar # => "Au au"
```

---

## 🎯 Sobrescrita de Métodos

Se a subclasse tiver um método com o mesmo nome, ela **sobrescreve** o método da superclasse. Podemos usar `super` para chamar o método original.

```ruby
class Pai
  def saudacao
    "Olá!"
  end
end

class Filho < Pai
  def saudacao
    super + " Eu sou o filho."
  end
end

puts Filho.new.saudacao # => "Olá! Eu sou o filho."
```

---

## 🧠 Conclusão

Você agora sabe:

- Criar classes e objetos
- Usar `initialize` para construir objetos
- Declarar métodos de instância e de classe
- Usar variáveis de instância e de classe
- Fazer herança e sobrescrita

Na [Parte 2](aula_attr_em_ruby.md), veremos como controlar o acesso aos atributos com `attr_reader`, `attr_writer`, `attr_accessor`, além de `public`, `protected` e `private`.
