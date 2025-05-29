# 📚 Aula de Ruby: `ARGV` e `Dir`

## 🔹 O que é `ARGV`?

`ARGV` é uma **array especial** no Ruby que contém os **argumentos passados via linha de comando** ao executar um script Ruby.

### ✅ Para que serve?

Serve para permitir que o script Ruby seja dinâmico, ou seja, que receba parâmetros ao rodar no terminal.

---

### 🧪 Exemplo prático: script que imprime o nome passado

```ruby
# arquivo: saudacao.rb
nome = ARGV[0]

if nome.nil?
  puts "Você precisa passar um nome como argumento!"
else
  puts "Olá, #{nome}!"
end
```

#### 💻 Como rodar no terminal:

```bash
ruby saudacao.rb Vitor
```

#### 🖥️ Saída:

```
Olá, Vitor!
```

---

### 📦 Outro exemplo: somar números

```ruby
# arquivo: soma.rb
n1 = ARGV[0].to_i
n2 = ARGV[1].to_i

puts "A soma é: #{n1 + n2}"
```

```bash
ruby soma.rb 10 20
```

```
A soma é: 30
```

---

## 🔹 O que é `Dir`?

`Dir` é uma classe do Ruby usada para **trabalhar com diretórios**. Você pode listar arquivos, navegar por pastas, criar, remover diretórios e muito mais.

---

### ✅ Para que serve?

Ajuda na automação de tarefas que envolvem manipulação de arquivos e diretórios. Muito usado em scripts, deploys e utilitários.

---

### 📁 Exemplo: listar todos os arquivos `.rb` de um diretório

```ruby
# arquivo: listar_rb.rb
Dir.glob("*.rb").each do |arquivo|
  puts "Encontrei: #{arquivo}"
end
```

#### 📂 Saída esperada:

```
Encontrei: saudacao.rb
Encontrei: soma.rb
Encontrei: listar_rb.rb
```

---

### 🔄 Exemplo: listar arquivos recursivamente

```ruby
# Listar todos os arquivos e pastas, recursivamente
Dir.glob("**/*").each do |item|
  puts item
end
```

---

### 🧹 Exemplo real: apagar arquivos `.tmp`

```ruby
# Remove arquivos temporários
Dir.glob("*.tmp").each do |arquivo|
  File.delete(arquivo)
  puts "Arquivo apagado: #{arquivo}"
end
```

---

## 🧠 Dica Extra: combinar `ARGV` com `Dir`

```ruby
# arquivo: buscar_arquivos.rb
pasta = ARGV[0] || "."

Dir.glob("#{pasta}/**/*.rb").each do |arquivo|
  puts "Arquivo Ruby encontrado: #{arquivo}"
end
```

```bash
ruby buscar_arquivos.rb ./meus_scripts
```

---

## ✅ Conclusão

| Conceito | Utilidade |
|---------|-----------|
| `ARGV` | Receber argumentos via terminal para tornar scripts dinâmicos |
| `Dir` | Manipular e interagir com diretórios e arquivos |

---

**Essas duas ferramentas são essenciais para criar scripts Ruby práticos, automatizados e poderosos.**