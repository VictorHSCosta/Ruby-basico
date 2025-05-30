# Variáveis de Classe (`@@`) no Ruby e no Rails - Quando usar?

---

## O que é uma variável de classe?

Uma **variável de classe** em Ruby (escrita como `@@variavel`) é um tipo especial de variável que **pertence à classe como um todo** e não a uma instância específica da classe. Isso significa que seu valor é compartilhado entre:

* A própria classe,
* Qualquer subclasse que herde dessa classe,
* Todos os objetos instanciados dessa classe.

Isso a torna diferente das variáveis de instância, que são únicas para cada objeto.

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

Nesse exemplo, cada vez que criamos uma nova instância da classe `Exemplo`, incrementamos a variável de classe `@@contador`. Quando chamamos o método de classe `self.contador`, ele nos retorna o valor acumulado dessa variável.

---

## Comparativo de tipos de variáveis em Ruby

| Variável     | Visível onde?                     | Escopo                   |
| ------------ | --------------------------------- | ------------------------ |
| `@variavel`  | No **objeto** (instância)         | Instância                |
| `@@variavel` | Em toda a **classe e subclasses** | Classe                   |
| `CONSTANTE`  | Global para a classe              | Classe                   |
| `$variavel`  | Global (pro programa inteiro)     | Global (NÃO recomendado) |

Cada um desses tipos de variável tem seu caso de uso, e é importante entender as diferenças para evitar problemas inesperados.

---

## Quando **faz sentido usar `@@`?**

Na prática moderna, usar `@@` é cada vez mais raro. Mas teoricamente, poderia ser usado para:

* Guardar estado **global daquela classe** (ex: contador total de instâncias),
* Fazer um **contador interno** que serve para lógica de controle,
* Fazer **cache rápido** dentro da classe (embora não seja recomendado em apps Rails multi-processo).

Porém, esses casos quase sempre possuem soluções melhores e mais seguras hoje em dia.

---

## Problemas do `@@`

Existem diversas razões para evitar `@@` em projetos modernos:

1. **Compartilhada entre subclasses** → Subclasses herdam a variável e isso pode causar confusão.
2. **Não é thread-safe** → Rails normalmente roda com múltiplas threads e/ou múltiplos processos, o que pode gerar inconsistências.
3. **Não persiste** → Se o servidor reiniciar ou escalar horizontalmente, você perde o valor da variável.

Por isso, a comunidade Rails recomenda evitar esse padrão.

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

👉 É um método que você chama **na classe**, e não em uma instância da classe. Ele serve para executar lógica relacionada à classe como um todo.

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

Essa segunda forma é mais avançada e permite definir vários métodos de classe de uma vez.

---

## Por que usamos mais métodos de classe no Rails?

Muito simples:

1️⃣ Métodos de classe servem para **operações globais** da classe, não de um objeto específico.

2️⃣ São amplamente usados para:

✅ Consultas personalizadas (scopes),
✅ Serviços utilitários,
✅ Factory methods (ex: `.create_with_defaults`),
✅ Cálculos agregados e estatísticas (ex: `.count`, `.sum`).

---

## Exemplo no Rails: **escopo ou contador**

```ruby
class Post < ApplicationRecord
  # scope "pronto"
  scope :publicados, -> { where(publicado: true) }

  # método de classe "manual"
  def self.recentes
    order(created_at: :desc).limit(10)
  end
end

# Uso:
Post.publicados
Post.recentes
```

Scopes e métodos de classe são essenciais para manter o código limpo e reutilizável.

---

## Exemplo no Rails: **service object**

```ruby
# app/services/gerador_relatorio_usuarios.rb
class GeradorRelatorioUsuarios
  def self.call
    users = User.all
    # lógica de gerar PDF, CSV, JSON, etc
    puts "Relatório com \#{users.count} usuários gerado!"
  end
end

# Uso no controller:
class Admin::RelatoriosController < ApplicationController
  def usuarios
    GeradorRelatorioUsuarios.call
    redirect_to admin_dashboard_path, notice: "Relatório gerado!"
  end
end
```

Service Objects ajudam a manter o código de controllers e models enxuto e focado.

---

## `class_attribute` → boas práticas para "config global"

```ruby
class Usuario < ApplicationRecord
  class_attribute :minimo_idade
  self.minimo_idade = 18
end

puts Usuario.minimo_idade  # => 18
```

Vantagens:

✅ Não é bugado como `@@`,
✅ É seguro para produção,
✅ Funciona bem com herança.

---

## Resumindo o uso real no Rails

| Padrão do Rails                     | Como é feito                           |
| ----------------------------------- | -------------------------------------- |
| Scope (consulta personalizada)      | método de classe ou `scope`            |
| Relatórios, serviços                | Service Object com `self.call`         |
| Config global segura                | `class_attribute`                      |
| Estatísticas (ex: `.count`, `.sum`) | métodos de classe                      |
| Evitar `@@`                         | usar banco, Redis ou `class_attribute` |

---

## 🎁 Resumão

👉 Se você quer **fazer um código que calcula algo, ou retorna algo para o sistema utilizar → use MÉTODO DE CLASSE.**
👉 Se você quer **guardar uma informação global só em memória → cuidado com `@@` → quase sempre existe uma solução mais segura e moderna.**

---

E lembre-se: no Rails moderno, as boas práticas evoluíram muito. Evite `@@` e abrace as soluções como métodos de classe, `class_attribute`, cache externo (Redis) e persistência no banco de dados quando necessário. Isso garante código mais seguro, mais legível e muito mais robusto em ambientes de produção e em aplicações escaláveis!

---
