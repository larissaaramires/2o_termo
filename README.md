# 2º Termo - Repositório de Exercícios e Projetos

## Descrição

Este repositório reúne atividades desenvolvidas durante o 2º termo, incluindo exercícios de lógica e programação em JavaScript, projetos front-end em HTML/CSS e materiais de modelagem de dados e banco de dados. O objetivo é organizar os estudos e práticas realizadas nas disciplinas BCD, LIMA e PBE.

## Tecnologias utilizadas

- Node.js
- JavaScript (ES6)
- HTML5
- CSS
- SQL
- Modelagem conceitual em arquivos .brM
- Git e GitHub
- Biblioteca Node.js: readline-sync

## Estrutura de pastas

```text
2o_termo/
├── README.md
├── texto_para_gerar_readme
├── BCD/
│   ├── MODELOS_RELACIONAMENTOS_CONCEITUAL.brM
│   └── Aula04/
│       ├── DOCUMENTACAO_CLINICA_MEDICA_PROJETO.brM
│       ├── SMARTCOFFEE_CONCEITUAL.brM
│       └── Tabelas_clinica_medica.sql
├── LIMA/
│   ├── index.html
│   ├── index2.html
│   ├── Aula04/
│   │   ├── index.html
│   │   ├── index2.html
│   │   └── Imagens/
│   └── Projeto/
│       ├── index.html
│       ├── lanches.html
│       ├── salgados.html
│       ├── doces.html
│       ├── bebidas_geladas.html
│       ├── bebidas_quentes.html
│       └── Imagens/
└── PBE/
    ├── app5.js
    ├── package.json
    ├── package-lock.json
    ├── Aula10/
    │   ├── Logística/
    │   │   ├── calculadoraFrete.js
    │   │   └── sistemaEntrega.js
    │   └── Oficina/
    │       ├── app.js
    │       └── funcoesOficina.js
    ├── Exercicios/
    │   ├── array.js
    │   ├── array2.js
    │   ├── ex1.js
    │   ├── ex2.js
    │   ├── ex3.js
    │   ├── ex4.js
    │   ├── ex5.js
    │   ├── exercicio.js
    │   ├── exercicio2.js
    │   ├── exercicio3.js
    │   ├── exercicio4.js
    │   └── exercicio5.js
    └── Desafios/
        ├── desafio.js
        ├── desafio1.js
        ├── desafio2.js
        ├── desafio3.js
        ├── desafio4.js
        └── desafio5.js
```

## Resumo dos exercícios e projetos por aula

### BCD

A pasta BCD contém materiais de modelagem de banco de dados e documentação de projetos.

- `MODELOS_RELACIONAMENTOS_CONCEITUAL.brM`: modelo conceitual com relacionamentos entre entidades.
- `Aula04/DOCUMENTACAO_CLINICA_MEDICA_PROJETO.brM`: documentação do projeto de clínica médica.
- `Aula04/SMARTCOFFEE_CONCEITUAL.brM`: diagrama conceitual do projeto SmartCoffee.
- `Aula04/Tabelas_clinica_medica.sql`: script SQL com tabelas e estrutura do banco da clínica.

### LIMA

A pasta LIMA contém exercícios e páginas HTML/CSS, com foco em estruturação de páginas web.

- `index.html` e `index2.html`: exemplos de tags HTML, CSS, abreviações, blocos de texto e elementos semânticos.
- `Aula04/index.html` e `Aula04/index2.html`: atividades complementares da aula de HTML.
- `Projeto/`: site exemplar com páginas para menu de produtos do SmartCoffee, incluindo salgados, lanches, doces e bebidas.

### PBE

A pasta PBE reúne exercícios de lógica, algoritmos e desafios em JavaScript com uso de Node.js.

#### Arquivos principais

- `app5.js`: sistema de análise de crédito com validação de idade, renda e propriedade.
- `package.json`: configura as dependências do projeto, incluindo `readline-sync`.

#### Exercícios

- `Exercicios/array.js`: uso básico de arrays.
- `Exercicios/array2.js`: armazenamento de dados em arrays e cálculo de média.
- `Exercicios/ex1.js`: aprovação de crédito com entrada de dados.
- `Exercicios/ex2.js`: laço de repetição que conta de 0 a 100 em passos de 5.
- `Exercicios/ex3.js`: tabuada de um número.
- `Exercicios/ex4.js`: menu interativo de padaria.
- `Exercicios/ex5.js`: soma acumulada de preços até informar 0.
- `Exercicios/exercicio.js`, `exercicio2.js`, `exercicio3.js`, `exercicio4.js`, `exercicio5.js`: exercícios complementares de lógica e manipulação de dados.

#### Desafios

- `Desafios/desafio.js`: desafio inicial de lógica.
- `Desafios/desafio1.js`: verificação de idade mínima para votar.
- `Desafios/desafio2.js`: cálculo com desconto de 10%.
- `Desafios/desafio3.js`: comparação entre álcool e gasolina para abastecimento.
- `Desafios/desafio4.js`: classificação por faixa etária.
- `Desafios/desafio5.js`: simulação de empréstimo com validação de renda e nome.

#### Aula 10

- `Aula10/Logística/calculadoraFrete.js`: cálculo de frete.
- `Aula10/Logística/sistemaEntrega.js`: sistema de entrega e logística.
- `Aula10/Oficina/app.js`: aplicação da oficina.
- `Aula10/Oficina/funcoesOficina.js`: funções auxiliares da oficina.

## Instruções para executar os arquivos com Node.js

1. Instale o Node.js LTS em seu computador.
2. Abra o terminal no diretório raiz do projeto.
3. Acesse a pasta PBE:

```bash
cd PBE
```

4. Instale as dependências do projeto:

```bash
npm install
```

5. Execute um arquivo JavaScript com o comando:

```bash
node app5.js
```

Exemplos adicionais:

```bash
node Exercicios/ex3.js
node Exercicios/ex4.js
node Desafios/desafio3.js
```

> Alguns exercícios usam a biblioteca `readline-sync` para leitura de dados no terminal.

## Instruções de Git

```bash
# Inicializar o repositório
git init

# Adicionar arquivos ao controle de versionamento
git add .

# Registrar a alteração
git commit -m "Adicionar projeto e exercícios do 2º termo"

# Criar branch principal
git branch -M main

# Vincular ao repositório remoto
git remote add origin <URL_DO_REPOSITORIO>

# Enviar para o GitHub
git push -u origin main
```

## Autor

Larissa Ramires

