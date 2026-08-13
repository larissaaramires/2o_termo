# 2o_termo

## Descrição

Repositório com exercícios, desafios e pequenos projetos desenvolvidos durante o 2º termo. Contém exemplos em JavaScript (Node.js) e páginas HTML/CSS para práticas de Front‑End.

## Tecnologias utilizadas

- Node.js
- JavaScript (ES6)
- HTML5
- CSS básico
- Dependência Node: `readline-sync` (usada em exercícios de entrada de dados)

## Estrutura de pastas

- BCD/: arquivos de modelagem (.brM)
- LIMA/: material e projeto Front‑End (HTML)
	- index.html, index2.html
	- Projeto/: páginas do projeto SmartCoffee (salgados, lanches, doces, bebidas)
- PBE/: projetos e scripts em Node
	- app5.js: exemplo de sistema de análise de crédito
	- package.json / package-lock.json
	- Exercicios/: exercícios em JavaScript (loops, arrays, menus)
	- desafios/: pequenos desafios/algoritmos em JavaScript

## Resumo dos exercícios e arquivos

- `PBE/app5.js`: "Sistema de Análise de Crédito" — coleta nome, idade, renda e verifica aprovação de crédito.
- `PBE/package.json`: registra dependência `readline-sync` usada para entrada de dados no terminal.

Pasta `PBE/Exercicios/`:
- `array.js`: exemplo básico de uso de array (acesso por índice).
- `array2.js`: sistema de pesagem com armazenamento em array e cálculo de média.
- `ex1.js`: sistema de aprovação de crédito (entrada de dados e lógica condicional).
- `ex2.js`: laço `while` que conta de 0 a 100 em passos de 5.
- `ex3.js`: imprime a tabuada de um número (laço `for`).
- `ex4.js`: menu interativo de padaria (opções: calcular venda, horário, sair).
- `ex5.js`: soma de preços até o usuário digitar `0` (subtotal acumulado).

Pasta `PBE/desafios/`:
- `desafio1.js`: verificador de idade mínima para votar.
- `desafio2.js`: aplica desconto de 10% para contas >= 100.
- `desafio3.js`: decide entre abastecer com álcool ou gasolina (relação de preços).
- `desafio4.js`: classifica categoria por faixa etária (infantil, juvenil, adulto, sênior).
- `desafio5.js`: simulador simples de empréstimo (checa renda e nome sujo).

Pasta `LIMA/`:
- `index.html` e `index2.html`: exemplos introdutórios de tags HTML e navegação.
- `LIMA/Projeto/`: site exemplo "SmartCoffee" com páginas de produtos (salgados, lanches, doces, bebidas).

## Como executar os arquivos Node.js

1. Instale o Node.js (versão LTS recomendada).
2. Abra um terminal na pasta `PBE` e instale dependências (caso ainda não instalado):

```bash
cd PBE
npm install
```

3. Executar um arquivo JavaScript com Node (exemplo):

```bash
node app5.js
# ou
node Exercicios/ex3.js
```

Observação: muitos exercícios usam `readline-sync` para entrada interativa.

## Instruções Git (básicas)

```bash
# Inicializar repositório (se necessário)
git init
# Adicionar arquivos
git add .
git commit -m "Adicionar exercícios do 2º termo"
# Criar branch e enviar para remoto
git branch -M main
git remote add origin <URL_DO_REPOSITORIO>
git push -u origin main
```

## Autor

Larissa Ramires de Souza

---
> Observação: Resumos dos exercícios foram gerados a partir dos arquivos presentes nas pastas `PBE` e `LIMA`. Se desejar que eu detalhe cada exercício (comentários, melhores práticas ou testes), posso expandir o README com seções adicionais.