# Guia Rápido: Metaprogramação em Ruby

---

## O que é Metaprogramação?

> **Metaprogramação** é quando seu código cria, altera ou executa código enquanto o programa está rodando.
> É como se o Ruby conseguisse **mexer em si mesmo em tempo real**.

---

## Por que usar?

* Flexibilidade
* Reduz repetição de código (DRY)
* Automatiza tarefas repetitivas
* Útil em frameworks como **Rails**

---

## Ferramentas de Metaprogramação no Ruby

### 1. `send`

Chama **qualquer método**, mesmo `private` ou `protected`.

```ruby
obj.send(:nome_do_metodo, *argumentos)
```

### 2. `public_send`

Chama apenas **métodos públicos**.

```ruby
obj.public_send(:nome_do_metodo)
```

### 3. `define_method`

Cria **métodos dinamicamente**.

```ruby
class Pessoa
  define_method(:falar) do
    puts "Oi!"
  end
end

Pessoa.new.falar  # => "Oi!"
```

### 4. `method_missing`

Intercepta chamadas a **métodos que não existem**.

```ruby
class Teste
  def method_missing(name, *args)
    puts "Chamou o metodo: #{name}"
  end
end

Teste.new.qualquer_coisa  # => Chamou o metodo: qualquer_coisa
```

### 5. `instance_variable_get` e `instance_variable_set`

Acessa variáveis de instância dinamicamente.

```ruby
pessoa = Pessoa.new("Vitor", 22)
pessoa.instance_variable_get("@nome")
# => "Vitor"
```

### 6. `class_eval` e `instance_eval`

Executa código dentro do contexto da classe ou da instância.

```ruby
Pessoa.class_eval do
  def saudacao
    puts "Oi, #{@nome}!"
  end
end
```

---

## Exemplo prático com Rails

```ruby
User.find_by_email("vitor@example.com")
```

* Esse método **não existe no código da classe User**.
* O Rails intercepta com `method_missing` e **gera a query dinamicamente**.

---

## Resumo Rápido

| Ferramenta              | O que faz                            |
| ----------------------- | ------------------------------------ |
| `send`                  | Chama qualquer método                |
| `public_send`           | Chama método público                 |
| `define_method`         | Cria método dinamicamente            |
| `method_missing`        | Intercepta métodos inexistentes      |
| `instance_variable_get` | Lê variável de instância             |
| `class_eval`            | Executa código no contexto da classe |

---

## Cuidado!

* `send` quebra encapsulamento (use com responsabilidade)
* Metaprogramação em excesso torna o código **difícil de entender e manter**

---

## Quando usar?

* Quando você realmente precisa de **flexibilidade**
* Em frameworks, gems, DSLs (ex: Rails, RSpec)

---

## Conclusão

Ruby foi feito para ser **super flexível**, e metaprogramação é uma das maiores forças da linguagem. Mas como toda ferramenta poderosa, use com **sabedoria**.

---

Se quiser, posso criar um arquivo com **exercícios práticos de metaprogramação** pra você treinar. Quer que eu faça?
