# 🔁 Métodos de Iteração de Arrays no Ruby

Neste artigo, vamos explorar os principais métodos de iteração de arrays no Ruby, como `each`, `map`, `select`, `reject`, `reduce`, entre outros. Esses métodos são essenciais para manipular coleções de forma elegante e eficiente.

---

## 📌 1. `each`

### ✅ O que faz:
Percorre cada elemento de um array executando um bloco de código.

```ruby
[1, 2, 3].each { |n| puts n }
```

### ⚡ Performance:
Muito rápido e ideal quando você só precisa iterar sem transformar a coleção.

---

## 🔄 2. `map` / `collect`

### ✅ O que faz:
Cria um **novo array** com os resultados do bloco.

```ruby
[1, 2, 3].map { |n| n * 2 } # => [2, 4, 6]
```

### 🧠 Curiosidade:
`map` e `collect` são idênticos — `map` é mais comum e mais legível.

---

## 🔍 3. `select` / `filter`

### ✅ O que faz:
Retorna um novo array **apenas com os elementos que retornam `true` no bloco**.

```ruby
[1, 2, 3, 4].select { |n| n.even? } # => [2, 4]
```

---

## ❌ 4. `reject`

### ✅ O que faz:
O oposto de `select`: retorna os elementos para os quais o bloco **retorna `false`**.

```ruby
[1, 2, 3, 4].reject { |n| n.even? } # => [1, 3]
```

---

## 🤝 5. `reduce` / `inject`

### ✅ O que faz:
Acumula um valor passando um acumulador e o elemento atual para o bloco.

```ruby
[1, 2, 3, 4].reduce(0) { |acc, n| acc + n } # => 10
```

---

## 🎯 6. `find` / `detect`

### ✅ O que faz:
Retorna **o primeiro elemento** que satisfaz a condição.

```ruby
[1, 2, 3, 4].find { |n| n > 2 } # => 3
```

---

## 🔢 7. `find_index`

### ✅ O que faz:
Retorna o índice do **primeiro elemento** que satisfaz a condição.

```ruby
[10, 20, 30].find_index { |n| n == 20 } # => 1
```

---

## 📊 8. `group_by`

### ✅ O que faz:
Agrupa os elementos em um hash com base no resultado do bloco.

```ruby
[1, 2, 3, 4, 5].group_by { |n| n.even? }
# => {false=>[1, 3, 5], true=>[2, 4]}
```

---

## 🎛 9. `partition`

### ✅ O que faz:
Divide o array em dois arrays: um com elementos que retornam `true` e outro com `false`.

```ruby
[1, 2, 3, 4].partition(&:even?)
# => [[2, 4], [1, 3]]
```

---

## 🧽 10. `compact_map`

### ✅ O que faz:
Combina `map` e `compact`: transforma e remove `nil`.

```ruby
[1, nil, 2].compact_map { |n| n&.*(2) } # => [2, 4]
```

---

## ⏹ 11. `take_while` / `drop_while`

### ✅ O que faz:
- `take_while`: pega elementos **enquanto** a condição for verdadeira.
- `drop_while`: **descarta** enquanto a condição for verdadeira.

```ruby
[1, 2, 3, 4].take_while { |n| n < 3 } # => [1, 2]
[1, 2, 3, 4].drop_while { |n| n < 3 } # => [3, 4]
```

---

## 🧪 12. `each_with_index`

### ✅ O que faz:
Itera com acesso ao **índice** de cada elemento.

```ruby
["a", "b", "c"].each_with_index { |val, i| puts "#{i}: #{val}" }
```

---

## 🧮 13. `zip`

### ✅ O que faz:
Combina arrays em pares de elementos.

```ruby
[1, 2, 3].zip(["a", "b", "c"])
# => [[1, "a"], [2, "b"], [3, "c"]]
```

---

## 🚀 Qual é o mais rápido?

### ⚡ Benchmarks (gerais):

| Método     | Performance (relativa) |
|------------|------------------------|
| `each`     | 🔥 Mais rápido (sem transformação) |
| `map`      | Rápido, mas cria novo array |
| `reduce`   | Levemente mais lento, mas poderoso |
| `select`   | Boa performance com condições simples |

> **Conclusão:** Se você **só quer iterar**, use `each`. Se precisa **transformar**, `map`. Para **filtrar**, `select` ou `reject`. Para **acumular**, `reduce`.

---

## ✅ Conclusão

Ruby oferece uma variedade de métodos para trabalhar com arrays de forma expressiva e funcional. Saber **qual método usar em cada caso** é fundamental para escrever código mais limpo, performático e idiomático.