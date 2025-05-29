# 🧠 Aula Completa: `attr_reader`, `attr_writer`, `attr_accessor` e Níveis de Acesso em Ruby

## 🚀 Objetivo

- Entender o que são e para que servem `attr_reader`, `attr_writer` e `attr_accessor`
- Compreender os níveis de acesso em Ruby: `public`, `protected` e `private`
- Comparar com os modificadores de acesso do Java

---

## 📌 O que são `attr_reader`, `attr_writer` e `attr_accessor`?

Esses são **atalhos em Ruby** para gerar métodos automaticamente dentro de uma classe. Eles são usados para criar **getters e setters** de forma elegante e rápida.

### ✅ `attr_reader`

Cria **apenas o getter** para um atributo. Ou seja, você pode **ler o valor**, mas **não modificar diretamente**.

```ruby
class Pessoa
  attr_reader :nome

  def initialize(nome)
    @nome = nome
  end
end

p = Pessoa.new("Vitor")
puts p.nome # => "Vitor"
p.nome = "João" # => ERRO! método setter não existe
```

---

### ✅ `attr_writer`

Cria **apenas o setter**. Você pode **modificar o valor**, mas **não pode acessá-lo diretamente**.

```ruby
class Pessoa
  attr_writer :idade

  def initialize(idade)
    @idade = idade
  end
end

p = Pessoa.new(22)
p.idade = 30 # funciona!
puts p.idade # => ERRO! método getter não existe
```

---

### ✅ `attr_accessor`

Cria **getter e setter**. Você pode **ler e escrever** o valor do atributo.

```ruby
class Pessoa
  attr_accessor :email

  def initialize(email)
    @email = email
  end
end

p = Pessoa.new("vitor@email.com")
puts p.email         # => "vitor@email.com"
p.email = "novo@email.com"
puts p.email         # => "novo@email.com"
```

---

## 🛡 Níveis de Acesso em Ruby

Ruby tem 3 níveis principais de visibilidade para métodos:

| Modificador | Acesso | Semelhante em Java |
|-------------|--------|--------------------|
| `public`    | Qualquer um pode acessar | `public` |
| `protected` | Só instâncias da mesma classe ou subclasses | `protected` |
| `private`   | Apenas dentro da própria instância | `private` |

> **Importante:** Diferente de Java, **Ruby não usa modificadores para atributos diretos**. A proteção se dá nos **métodos**, não nas variáveis de instância.

---

### 🔓 `public` (Padrão)

Todos os métodos definidos fora de `private` ou `protected` são públicos por padrão.

```ruby
class Animal
  def falar
    "Au au"
  end
end

a = Animal.new
puts a.falar # => "Au au"
```

---

### 🟡 `protected`

O método só pode ser chamado por **outra instância da mesma classe** ou de uma **subclasse**.

```ruby
class Usuario
  attr_accessor :senha

  def initialize(senha)
    @senha = senha
  end

  protected

  def senha_igual?(outra)
    self.senha == outra.senha
  end
end

u1 = Usuario.new("1234")
u2 = Usuario.new("1234")

puts u1.senha_igual?(u2) # => true
puts u1.senha # => "1234" (porque o atributo é público por causa do accessor)
puts u1.senha_igual?("senha") # => erro, não é uma instância
```

---

### 🔒 `private`

Só pode ser chamado **dentro da própria instância**, **sem receiver explícito**.

```ruby
class Cofre
  def abrir
    autenticar
    "Cofre aberto!"
  end

  private

  def autenticar
    puts "Verificando digital..."
  end
end

c = Cofre.new
puts c.abrir
c.autenticar # => ERRO! método privado
```

> ⚠️ Você **não pode chamar métodos privados com `self.`**, mesmo dentro da classe.

---

## 🧠 Resumo Comparativo: Ruby vs Java

| Conceito            | Ruby                             | Java                          |
|---------------------|----------------------------------|-------------------------------|
| Getter              | `attr_reader :campo`             | `getCampo()`                  |
| Setter              | `attr_writer :campo`             | `setCampo(valor)`             |
| Getter + Setter     | `attr_accessor :campo`           | Ambos os métodos              |
| Modificador Público | `public`                         | `public`                      |
| Protegido           | `protected`                      | `protected`                   |
| Privado             | `private`                        | `private`                     |
| Protege variáveis?  | Não, apenas métodos              | Sim, pode proteger atributos  |

---

## 🛠 Dica Profissional

Evite deixar tudo como `attr_accessor`. Isso quebra o encapsulamento. Prefira usar `attr_reader` e crie setters manuais se precisar de lógica adicional ao modificar um valor.

---

## 🤘 Conclusão

Ruby é mais flexível que Java no controle de acesso, mas exige mais disciplina. Use esses recursos para criar classes mais limpas e seguras, sem abrir mão da expressividade do Ruby.