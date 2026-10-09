# 2º Termo - Repositório de Estudos e Exercícios

## Visão geral

Este repositório reúne atividades, exercícios, desafios e materiais de apoio desenvolvidos no segundo termo do curso. O conteúdo está organizado em quatro áreas principais:

- BCD: Banco de Dados
- LIMA: Linguagem de Marcação
- PBE: Programação Back-End
- PSOF: páginas e layouts desenvolvidos em HTML/CSS

O objetivo do projeto é centralizar os arquivos práticos e teóricos produzidos ao longo do período, permitindo revisão, estudo e execução dos exercícios com facilidade.

## Descrição do projeto

O workspace contém exercícios de modelagem conceitual e SQL, páginas estáticas em HTML/CSS, e scripts em JavaScript executados com Node.js. Cada pasta representa uma etapa de aprendizagem, com foco em lógica de programação, estrutura de páginas web, manipulação de dados e criação de projetos práticos.

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
│   ├── Aula09/
│   ├── Smartcoffee/
│   ├── Somativa/
│   ├── MODELOS_RELACIONAMENTOS_CONCEITUAL.brM
│   └── DOCUMENTACAO_CLINICA_MEDICA_PROJETO.brM
├── LIMA/
│   ├── Aula02/
│   ├── Aula03/
│   ├── Aula04/
│   ├── Aula05/
│   ├── Aula06/
│   ├── Aula09/
│   ├── Aula10/
│   ├── Aula11/
│   ├── Projeto/
│   ├── Somativa/
│   └── node_modules/
├── PBE/
│   ├── Atividades/
│   ├── Aulas-01a10/
│   │   ├── Aula01/
│   │   ├── Aula02/
│   │   ├── Aula03/
│   │   ├── Aula04/
│   │   ├── Aula05/
│   │   ├── Aula06/
│   │   ├── Aula07/
│   │   ├── Aula08/
│   │   └── Aula09/
│   ├── Aulas-11a20/
│   │   ├── Aula13/
│   │   └── Aula14/
│   ├── Desafios/
│   ├── Exercicios/
│   ├── Somativa/
│   └── node_modules/
├── PSOF/
│   ├── CSS/
│   ├── Imagens/
│   ├── capa.html
│   └── index.html
├── README.md
├── texto_para_gerar_readme
├── .git/
└── .gitignore
```

## Resumo dos exercícios e aulas

### BCD — Banco de Dados

- `Aula04`: modelagem conceitual de banco de dados, criação de diagramas e scripts para clínica médica e SmartCoffee.
- `Aula05`: aprofundamento em SQL com estruturas de dados, alterações e consultas de dados.
- `Aula06`: scripts e organização de banco de dados com foco em estrutura e funcionalidade.
- `Aula07`: cardinalidade e relações entre entidades em modelagem lógica.
- `Aula08`: desafios de SQL e manipulação de registros.
- `Aula09`: desenvolvimento de consultas e exercícios de DQL.
- `Smartcoffee`: projeto de modelagem e banco para uma cafeteria.
- `Somativa`: atividade final com cenário e modelagem de oficina e processos.

### LIMA — Linguagem de Marcação

- `Aula02`: introdução ao HTML com textos, listas, imagens e links.
- `Aula03`: construção de páginas com estrutura básica e organização de conteúdo.
- `Aula04`: uso de imagens, recursos visuais e elementos de layout.
- `Aula05`: páginas semânticas, currículo, notícias e artigos em HTML.
- `Aula06`: exercícios com CSS inline, interno e externo, além de listas e formatação.
- `Aula09`: páginas temáticas com foco em visual e navegação.
- `Aula10`: exercícios de layout e estilização com CSS.
- `Aula11`: continuidade de práticas com HTML/CSS e exercícios específicos.
- `Projeto`: site dinâmico em estrutura estática para uma cafeteria.
- `Somativa`: atividade final com proposta visual e conteúdo institucional.

### PBE — Programação Back-End

- `Atividades`: exercícios práticos com lógica e manipulação de dados.
- `Aulas-01a10`: estudo de variáveis, operações, laços, arrays, funções, objetos, JSON e leitura de dados.
- `Aulas-11a20`: exercícios mais avançados, incluindo estruturas de código e desenvolvimento lógico em JavaScript.
- `Desafios`: tarefas de interpretação e resolução de problemas.
- `Exercicios`: conjunto complementar de práticas de programação.
- `Somativa`: avaliações aplicadas em cenários reais de lógica e cálculo.

### PSOF

- `capa.html` e `index.html`: estrutura de página estática com layout e conteúdo visual.
- `CSS/`: arquivos de estilos para organização e apresentação visual.
- `Imagens/`: recursos gráficos utilizados na página.

## Como executar os arquivos com Node.js

1. Abra o terminal no diretório do projeto:

```bash
cd C:\caminho\para\2o_termo
```

2. Execute qualquer arquivo `.js` com o Node:

```bash
node PBE/Aulas-01a10/Aula01/olaMundo.js
node PBE/Aulas-01a10/Aula01/app.js
node PBE/Aulas-01a10/Aula01/imc.js
```

3. Caso o script utilize bibliotecas externas, instale as dependências do projeto ou da pasta desejada:

```bash
npm install readline-sync
```

4. Para rodar arquivos locais na raiz ou em outra pasta:

```bash
node nome-do-arquivo.js
```

> Se o script solicitar entrada do usuário, o terminal solicitará os valores durante a execução.

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

- `git pull` — atualiza o repositório local com as alterações do remoto.
- `git log` — mostra o histórico de commits.
- `git branch` — lista as branches existentes.
- `git checkout <nome-da-branch>` — troca de branch.
- `git restore --staged .` — remove arquivos do estágio sem apagar alterações locais.

## Autor

Larissa Ramires

## Observação

Este repositório funciona como material de estudo do segundo termo, reunindo exercícios práticos, projetos e arquivos de apoio para revisão das disciplinas de Banco de Dados, Linguagem de Marcação e Programação Back-End.
