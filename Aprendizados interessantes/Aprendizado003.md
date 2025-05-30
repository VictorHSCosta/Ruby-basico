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
$redis.incr("post:\#{post.id}:views")
```

### Rails.cache

```ruby
Rails.cache.fetch("post:\#{post.id}:views") { 0 }
```

---

## Resumo final

| Para que serve `@@`?                                   | Na prática usa?                    |
| ------------------------------------------------------ | ---------------------------------- |
| Estado global na classe                                | Raramente (melhor evitar em Rails) |
| Contador simples (exemplo didático)                    | Sim, em exemplos                   |
| Cache rápido (não recomendado em produção)             | Não                                |
| Rails moderno → prefira `@` + Redis + DB + Rails.cache | Sim!                               |

---

Se quiser exemplos completos de cada um (com código comentado), só pedir! 🚀
