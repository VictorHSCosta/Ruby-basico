# Variáveis de Classe (`@@`) no Ruby e no Rails - Quando usar?

---

## O que é uma variável de classe?

Uma **variável de classe** em Ruby (escrita como `@@variavel`) é uma variável que **pertence à classe como um todo**, e não a um objeto específico.

Ela é **compartilhada** entre:

* a própria classe,
* suas subclasses,
* todos os objetos instanciados dessa classe.

---

## Exemplo básico

```ruby
class Exemplo
  @@contador = 0

  def initialize
    @@contador += 1
  end

  def self.contador
    @@contador
  end
end

Exemplo.new
Exemplo.new

puts Exemplo.contador  # => 2
```

---

## Comparativo de tipos de variáveis em Ruby

| Variável     | Visível onde?                     | Escopo                   |
| ------------ | --------------------------------- | ------------------------ |
| `@variavel`  | No **objeto** (instância)         | Instância                |
| `@@variavel` | Em toda a **classe e subclasses** | Classe                   |
| `CONSTANTE`  | Global para a classe              | Classe                   |
| `$variavel`  | Global (pro programa inteiro)     | Global (NÃO recomendado) |

---

## Quando **faz sentido usar `@@`?**

Quase nunca hoje em dia. Mas em teoria:

* Guardar estado **global daquela classe**
* Fazer um **contador interno**
* Fazer **cache rápido** dentro da classe (NÃO recomendado em apps Rails multi-processo)

---

## Problemas do `@@`

1. **Compartilhada entre subclasses** → herança bagunça
2. **Não é thread-safe** → Rails roda com threads/processos → bugs
3. **Não persiste** → reiniciar server = perde tudo

---

## No Rails moderno, o que usar no lugar?

### Variáveis de instância da classe

```ruby
class Post
  @config = {}

  def self.config
    @config
  end
end
```

### Banco de dados

```ruby
# Exemplo contador de visualizações
@post.increment!(:views_count)
```

### Redis (cache)

```ruby
$redis.incr("post:#{post.id}:views")
```

### Rails.cache

```ruby
Rails.cache.fetch("post:#{post.id}:views") { 0 }
```

---

## Resumo final sobre variáveis de classe

| Para que serve `@@`?                                   | Na prática usa?                    |
| ------------------------------------------------------ | ---------------------------------- |
| Estado global na classe                                | Raramente (melhor evitar em Rails) |
| Contador simples (exemplo didático)                    | Sim, em exemplos                   |
| Cache rápido (não recomendado em produção)             | Não                                |
| Rails moderno → prefira `@` + Redis + DB + Rails.cache | Sim!                               |

---

# Métodos de Classe em Ruby e no Rails - Explicação Simples

---

## O que é um **método de classe**?

👉 É um método que você chama **na classe**, e não num objeto da classe.

---

## Exemplo normal (método de instância):

```ruby
class Usuario
  def nome
    "Vitor"
  end
end

user = Usuario.new
puts user.nome  # Chamando o método no OBJETO
```

---

## Exemplo com **método de classe**:

```ruby
class Usuario
  def self.descricao
    "Classe de usuários do sistema"
  end
end

puts Usuario.descricao  # Chamando o método na CLASSE
```

👉 O `self.` significa que o método é da CLASSE.

---

## Sintaxe resumida

### Método de instância:

```ruby
def metodo
```

### Método de classe:

```ruby
def self.metodo
```

ou

```ruby
class << self
  def metodo
  end
end
```

---

## Por que usamos mais métodos de classe no Rails?

Muito simples:

1️⃣ Métodos de classe servem pra **coisas globais da classe**, não de um objeto só.

2️⃣ São muito usados pra:

✅ Consultas personalizadas
✅ Serviços utilitários
✅ Factory methods (ex: `.create_with_defaults`)
✅ Contagem, estatísticas

---

## Exemplo no Rails: **escopo ou contador**

```ruby
class Post < ApplicationRecord
  def self.publicados
    where(publicado: true)
  end
end

# Uso:
Post.publicados
```

---

## Exemplo no Rails: **service object**

```ruby
class RelatorioService
  def self.gerar
    # lógica de gerar relatório
    puts "Relatório gerado"
  end
end

# Uso:
RelatorioService.gerar
```

---

## Resumindo

| Coisa                               | Método de instância | Método de classe |
| ----------------------------------- | ------------------- | ---------------- |
| Agir sobre UM objeto específico     | ✅                   | ❌                |
| Agir sobre TODOS, ou sobre a classe | ❌                   | ✅                |

---

## Por que método de classe é mais usado que `@@variavel`?

1️⃣ Método de classe é SEGURO (não tem problema de cache errado)
2️⃣ Método de classe não armazena "estado sujo", é **reativo** (roda quando você chama)
3️⃣ Você pode colocar QUALQUER lógica lá dentro

---

## Exemplo prático

### ERRADO com `@@`:

```ruby
class Contador
  @@contador = 0

  def self.incrementar
    @@contador += 1
  end

  def self.valor
    @@contador
  end
end
```

Problema: se você reiniciar a app, perde tudo. Não funciona bem com múltiplos processos.

---

### CERTO com método de classe e banco:

```ruby
class Post < ApplicationRecord
  def self.total_posts
    count
  end
end

puts Post.total_posts
```

👉 Aqui é **consultado direto no banco** → sempre dá o valor correto.

---

## 🎁 Resumão

👉 Se você quer **fazer um código que calcula algo, ou retorna algo pra usar no sistema → usa MÉTODO DE CLASSE.**
👉 Se você quer **guardar uma informação global só em memória → cuidado com `@@` → quase sempre tem solução melhor.**

---
