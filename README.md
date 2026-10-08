# 2º Termo - Repositório de Estudos e Exercícios

## Visão geral

Este repositório reúne as atividades, exercícios, desafios e materiais de apoio desenvolvidos no segundo termo do curso. O conteúdo está organizado em três áreas principais:

- BCD: Banco de Dados
- LIMA: Linguagem de Marcação
- PBE: Programação Back-End

O objetivo do projeto é centralizar os arquivos práticos e teóricos produzidos ao longo do período, facilitando o estudo, a revisão e a execução dos exercícios em qualquer momento.

## Descrição do projeto

O projeto contém atividades de modelagem de banco de dados, desenvolvimento web com HTML e CSS, e programação em JavaScript com Node.js. Em cada módulo, são apresentados exercícios e desafios voltados à prática, com foco em lógica de programação, estrutura de páginas, modelagem conceitual e manipulação de dados.

## Tecnologias utilizadas

- HTML5
- CSS3
- JavaScript
- Node.js
- SQL e MySQL/MariaDB
- brModelo (.brM)
- JSON
- Módulo nativo `fs` do Node.js
- Git e GitHub
- Visual Studio Code
- Dependências como `readline-sync` em alguns scripts

## Estrutura de pastas

```text
2o_termo/
├── BCD/
│   ├── Aula04/
│   ├── Aula05/
│   ├── Aula06/
│   ├── Aula07/
│   ├── Aula08/
│   ├── Smartcoffee/
│   ├── Somativa/
│   └── MODELOS_RELACIONAMENTOS_CONCEITUAL.brM
├── LIMA/
│   ├── Aula02/
│   ├── Aula03/
│   ├── Aula04/
│   ├── Aula05/
│   ├── Aula06/
│   ├── Aula09/
│   ├── Aula10/
│   ├── Projeto/
│   ├── Somativa/
│   └── index.html
├── PBE/
│   ├── Atividades/
│   ├── Aulas-01a10/
│   ├── Aulas-11a20/
│   ├── Desafios/
│   ├── Exercicios/
│   ├── Somativa/
│   └── node_modules/
├── README.md
├── texto_para_gerar_readme
├── .git/
└── .gitignore (se existir no ambiente)
```

## Resumo dos exercícios e aulas

### BCD — Banco de Dados

- `Aula04`: introdução à modelagem conceitual e criação de scripts SQL para clínica médica e SmartCoffee.
- `Aula05`: aprofundamento em SQL com comandos como `CREATE`, `ALTER`, `INSERT`, `SELECT` e exclusão/remoção de dados.
- `Aula06`: exploração de estrutura de banco e scripts com foco em banco `sesi_extensaovsTA`.
- `Aula07`: modelagem de cardinalidade e relacionamento entre entidades.
- `Aula08`: prática com desafios SQL e manipulação de dados.
- `Smartcoffee`: arquivos de modelagem e scripts do projeto de cafeteria.
- `Somativa`: atividade final de modelagem de oficina com clientes, peças, serviços e ordens de serviço.

### LIMA — Linguagem de Marcação

- `Aula02`: introdução ao HTML com formatação de texto, listas, imagens e links.
- `Aula03`: continuidade em estruturação de páginas com HTML básico.
- `Aula04`: trabalho com imagens, atributos e estilização simples.
- `Aula05`: páginas semânticas com currículo, notícias e artigos.
- `Aula06`: exercícios com CSS inline, interno, externo e listas.
- `Aula09`: desenvolvimento de páginas de café e navegação visual.
- `Aula10`: atividades de layout e CSS aplicado a exercícios específicos.
- `Projeto`: site temático de cafeteria com diferentes páginas.
- `Somativa`: atividade final com página institucional e elementos visuais.

### PBE — Programação Back-End

- `Atividades`: exercícios práticos sobre operações com JS e lógica de programação.
- `Aulas-01a10`: sequência de aulas sobre variáveis, condições, laços, arrays, funções, objetos, JSON, tratamento de erros e leitura de dados.
- `Aulas-11a20`: exercícios mais avançados envolvendo sensores, ferramentas, inspeção e manipulação de arquivos/JSON.
- `Desafios`: tarefas propostas com foco em resolução lógica e interpretação de problemas.
- `Exercicios`: conjunto de exercícios complementares de programação.
- `Somativa`: avaliações de lógica, cálculos e estruturas de dados aplicadas a cenários reais.

## Como executar os arquivos com Node.js

1. Abra o terminal no diretório do projeto:

```bash
cd C:\caminho\para\2o_termo\2o_termo
```

2. Execute qualquer arquivo `.js` com Node.js:

```bash
node PBE/Aulas-01a10/Aula01/olaMundo.js
node PBE/Aulas-01a10/Aula04/contador.js
node PBE/Desafios/desafio1.js
```

3. Se o script depender de bibliotecas externas, instale as dependências na pasta:

```bash
npm install readline-sync
```

4. Para executar arquivos na raiz do projeto ou em outra pasta:

```bash
node nome-do-arquivo.js
```

> Caso o arquivo receba entrada do usuário, o terminal solicitará dados durante a execução.

## Instruções de Git

```bash
git clone <url-do-repositorio>
cd 2o_termo
git status
git checkout -b nova-branch
git add .
git commit -m "Adiciona atividades do 2º termo"
git push origin nova-branch
```

Comandos úteis:

- `git pull` — atualiza o repositório local com as mudanças do remoto.
- `git log` — exibe o histórico de commits.
- `git branch` — lista as branches do projeto.
- `git checkout <nome-da-branch>` — alterna entre branches.
- `git restore --staged .` — remove arquivos do estágio sem apagar alterações locais.

## Autor

Larissa Ramires

## Observação

Este repositório funciona como um conjunto de materiais didáticos, exercícios práticos e arquivos de apoio do segundo termo, sendo útil tanto para estudos quanto para revisão do conteúdo das disciplinas.
