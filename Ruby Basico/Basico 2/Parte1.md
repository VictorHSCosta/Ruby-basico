# Manipulação de Arquivos `.txt` em Ruby

Nesta aula, vamos aprender a **ler**, **escrever** e **editar** arquivos de texto (`.txt`) usando a linguagem Ruby.

Manipular arquivos é uma habilidade essencial em programação: você pode, por exemplo, guardar informações, fazer logs, criar relatórios automáticos, entre muitas outras possibilidades!

---

## Como Funciona a Manipulação de Arquivos em Ruby?

Em Ruby, para trabalhar com arquivos, usamos principalmente a **classe `File`** e o **método `open`**.

Com eles, podemos:

- **Abrir** um arquivo já existente.
- **Criar** um novo arquivo.
- **Ler** o conteúdo de um arquivo.
- **Escrever** novos dados em um arquivo.
- **Adicionar** conteúdo sem apagar o que já existe.
- **Fechar** o arquivo depois de manipulado (muito importante!).

---

## Modos de Abertura de Arquivos

Quando abrimos um arquivo em Ruby, precisamos informar o **modo de abertura**, que define o que vamos fazer com ele:

| Modo | Significado | O que faz |
|:----:|:------------|:---------|
| `"r"`  | Read (ler)        | Abre um arquivo só para leitura. Erro se o arquivo não existir. |
| `"w"`  | Write (escrever)  | Abre para escrita. **Apaga** o conteúdo anterior! Cria o arquivo se não existir. |
| `"a"`  | Append (anexar)   | Abre para adicionar conteúdo ao final do arquivo. Não apaga o que já existe. |
| `"r+"` | Read + Write      | Abre para leitura e escrita. Não apaga o conteúdo. |

---

## Principais Métodos para Trabalhar com Arquivos

- **`File.open(nome, modo)`**: abre o arquivo.
- **`file.read`**: lê todo o conteúdo do arquivo.
- **`file.write(conteúdo)`**: escreve dados no arquivo (pode apagar o anterior dependendo do modo).
- **`file.puts(conteúdo)`**: escreve dados no arquivo e pula para uma nova linha automaticamente.
- **`file.close`**: fecha o arquivo (libera a memória, obrigatório).

---

## Exemplo Prático 1: Escrever em um Arquivo `.txt`

Vamos criar um arquivo e escrever dentro dele!

```ruby
# Abrindo (ou criando) o arquivo para escrita
file = File.open("exemplo.txt", "w")

# Escrevendo conteúdo
file.puts "Olá, mundo!"
file.puts "Estamos aprendendo Ruby e arquivos!"

# Sempre feche o arquivo depois de usar
file.close