# 📦 Aula de Ruby: Módulos (`module`)

## 🔹 O que é um módulo em Ruby?

Um **módulo** em Ruby é uma forma de **organizar e reutilizar código**. Ele pode conter **métodos**, **constantes** e até **outros módulos**.

> 📌 Módulos **não podem ser instanciados** como classes, mas podem ser incluídos ou estendidos por classes e objetos.

---

## 🧠 Por que usar módulos?

- **Organização** de funcionalidades
- **Reutilização** de código
- **Separação de responsabilidades**
- **Evita duplicação**
- Permite usar o conceito de **namespace**

---

## ✅ Criando um módulo

```ruby
module Saudacao
  def ola(nome)
    "Olá, #{nome}!"
  end
end
```

Esse módulo agora pode ser **incluído em uma classe**:

```ruby
class Pessoa
  include Saudacao
end

p = Pessoa.new
puts p.ola("Vitor") # => "Olá, Vitor!"
```

---

## 🔄 `include` vs `extend`

| Palavra-chave | Comportamento | Exemplo |
|---------------|----------------|---------|
| `include` | Adiciona métodos como **instância** | `obj.metodo` |
| `extend` | Adiciona métodos como **classe** (estáticos) | `Classe.metodo` |

### 🔹 Exemplo com `extend`

```ruby
module Log
  def logar(mensagem)
    puts "[LOG] #{mensagem}"
  end
end

class Sistema
  extend Log
end

Sistema.logar("Sistema iniciado") # => [LOG] Sistema iniciado
```

---

## 🔁 Módulos como namespaces

Você pode usar módulos para agrupar classes:

```ruby
module Admin
  class Usuario
    def self.permissao
      "Acesso total"
    end
  end
end

puts Admin::Usuario.permissao # => "Acesso total"
```

---

## 📚 Exemplo real: módulo utilitário

```ruby
module Conversor
  def self.km_para_milhas(km)
    km * 0.621371
  end
end

puts Conversor.km_para_milhas(10) # => 6.21371
```

---

## 🧪 Boas práticas com módulos

- Use para **agrupamento lógico** de métodos utilitários
- **Evite** misturar muitas responsabilidades num mesmo módulo
- Dê **nomes claros** e evite nomes genéricos

---

## ✅ Conclusão

| Conceito | Função |
|----------|--------|
| `module` | Define um módulo em Ruby |
| `include` | Adiciona os métodos do módulo como métodos de instância |
| `extend` | Adiciona os métodos do módulo como métodos de classe |
| `namespace` | Permite agrupar classes/métodos com lógica similar |

---

**Módulos são essenciais para organizar projetos Ruby maiores e tornar o código reutilizável, limpo e coeso.**