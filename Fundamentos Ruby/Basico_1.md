# Fundamentos de Ruby: Tipos e Natureza da Linguagem

## 1. Ruby é uma linguagem interpretada  
- Ruby foi projetado por Yukihiro “Matz” Matsumoto como uma linguagem **dinâmica**, **orientada a objetos** e **interpretada**.  
- No dia a dia você escreve arquivos `.rb` e roda com o interpretador MRI (Matz’s Ruby Interpreter), que faz parsing do código e executa direto.

## 2. Bytecode e Compilação Dinâmica  
- **YARV (Yet Another Ruby VM)**: desde Ruby 1.9, o MRI compila seu código fonte internamente para um **bytecode** próprio (YARV bytecode) e depois executa na VM.  
- **Não há um arquivo “.class” ou bytecode separado** gerado pra você distribuir — tudo rola em memória a cada execução.  
- Isso o torna **interpretação com compilação JIT/dinâmica**, mas **não** uma compilação AOT (ahead‑of‑time) como em C ou Go.

## 3. Variáveis em Ruby  
Em Ruby **tudo é objeto**, mas a forma de referenciar eles varia:

| Tipo              | Prefixo/Sintaxe | Escopo                                |
|-------------------|-----------------|---------------------------------------|
| Local             | `variavel`      | Dentro do método/bloco onde foi criada|
| Instância         | `@variavel`     | Dentro de um objeto/instância de classe |
| Classe            | `@@variavel`    | Dentro de toda a classe e subclasses  |
| Global            | `$variavel`     | Em qualquer ponto da aplicação        |
| Constante         | `Variavel`      | Geralmente em maiúsculo, valor fixo   |

> **Dica**: use _variáveis locais_ para cálculos temporários, _instância_ para estado de objeto, _classe_ para configuração compartilhada, e _constants_ para coisas que não mudam.

## 4. Principais Tipos de Dados  
Ruby tem vários _classes_ básicas para dados:

- **Numéricos**  
  - `Integer` (ex: `42`, `-10`)  
  - `Float`   (ex: `3.14`, `-0.001`)  
- **String**  
  - sequência de caracteres: `"olá, mundo"`  
- **Symbol**  
  - label imutável e internada: `:usuario`, `:email`  
- **Boolean**  
  - `true` (TrueClass) e `false` (FalseClass)  
- **Nil**  
  - objeto `nil` (NilClass) representa “vazio”  
- **Array**  
  - lista ordenada: `[1, "dois", :tres]`  
- **Hash**  
  - mapa chave→valor: `{ nome: "Vitor", idade: 22 }`  
- **Range**  
  - intervalo: `(1..5)` ou `(1...5)`  
- **Proc / Lambda**  
  - blocos reutilizáveis: `proc { |x| x * 2 }` ou `->(x){ x*2 }`

## 5. Exercício Proposto  
| Local             | `variavel`      | Dentro do método/bloco onde foi criada|
| Instância         | `@variavel`     | Dentro de um objeto/instância de classe |
| Classe            | `@@variavel`    | Dentro de toda a classe e subclasses  |
| Global            | `$variavel`     | Em qualquer ponto da aplicação        |
| Constante         | `Variavel`      | Geralmente em maiúsculo, valor fixo   |

> **Dica**: use _variáveis locais_ para cálculos temporários, _instância_ para estado de objeto, _classe_ para configuração compartilhada, e _constants_ para coisas que não mudam.

## 4. Principais Tipos de Dados  
Ruby tem vários _classes_ básicas para dados:

- **Numéricos**  
  - `Integer` (ex: `42`, `-10`)  
  - `Float`   (ex: `3.14`, `-0.001`)  
- **String**  
  - sequência de caracteres: `"olá, mundo"`  
- **Symbol**  
  - label imutável e internada: `:usuario`, `:email`  
- **Boolean**  
  - `true` (TrueClass) e `false` (FalseClass)  
- **Nil**  
  - objeto `nil` (NilClass) representa “vazio”  
- **Array**  
  - lista ordenada: `[1, "dois", :tres]`  
- **Hash**  
  - mapa chave→valor: `{ nome: "Vitor", idade: 22 }`  
- **Range**  
  - intervalo: `(1..5)` ou `(1...5)`  
- **Proc / Lambda**  
  - blocos reutilizáveis: `proc { |x| x * 2 }` ou `->(x){ x*2 }`

## 5. Exercício Proposto  
# Exercício Simples de Variáveis em Ruby

## Objetivo
- Definir todos os **tipos básicos** de variáveis em Ruby:  
  - Variável local  
  - Variável global  
  - Constante  
- Usar os **tipos básicos de dados**: Integer, Float, String, Symbol, Boolean, Nil, Array, Hash, Range.

## Instruções
Crie um arquivo chamado `variaveis_basico.rb` que:

1. Defina uma **constante** com um número inteiro.
2. Defina uma **variável global** com uma string.
3. Defina várias **variáveis locais** para os outros tipos (float, symbol, boolean, nil, array, hash, range).
4. **Imprima** o valor e o tipo de cada variável usando `puts` e `.class`.


