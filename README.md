# 2º Termo

Repositório de atividades práticas desenvolvidas durante o segundo termo, reunindo modelagem de bancos de dados, desenvolvimento web e programação back-end com JavaScript e Node.js.

## Tecnologias utilizadas

- HTML5 e CSS3
- JavaScript
- Node.js
- `readline-sync` para entrada de dados no terminal
- Módulo nativo `fs` e arquivos JSON
- SQL para MySQL/MariaDB
- brModelo para modelos conceituais (`.brM`)
- Git e GitHub
- Google Fonts em algumas páginas HTML

## Estrutura do projeto

```text
2o_termo/
├── BCD/                  # Banco de Dados: modelos, dicionários e scripts SQL
│   ├── Aula04/
│   ├── Aula05/
│   ├── Aula06/
│   ├── Smartcoffee/
│   └── Somativa/
├── LIMA/                 # Linguagem de Marcação: páginas HTML e estilos CSS
│   ├── Aula02/
│   ├── Aula04/
│   ├── Aula05/
│   ├── Aula06/
│   ├── Projeto/
│   └── Somativa/
├── PBE/                  # Programação Back-End: exercícios JavaScript
│   ├── Aula01/ ... Aula10/
│   ├── Desafios/
│   ├── Exercicios/
│   ├── package.json
│   └── package-lock.json
├── README.md
└── texto_para_gerar_readme
```

## Resumo das atividades

### BCD — Banco de Dados

- **Aula 04:** modelos conceituais e scripts iniciais de uma clínica médica e do SmartCoffee, com tabelas de pacientes, médicos e funcionários.
- **Aula 05:** aprofundamento de SQL e modelagem, usando `CREATE`, `ALTER`, `INSERT`, `SELECT`, `TRUNCATE`, `DROP` e comandos de consulta de bancos e tabelas. A clínica inclui agendamentos e medicamentos; o SmartCoffee inclui clientes, produtos, fornecedores, categorias e estoque.
- **Aula 06:** criação do banco `sesi_extensaovsTA`, da tabela `alunos` e uso de `SHOW TABLES`, `SHOW SCHEMAS` e `DESCRIBE`.
- **Smartcoffee:** modelo, dicionário de dados e scripts de uma cafeteria, com pedidos, pagamentos, delivery, fidelidade e estoque.
- **Somativa:** modelagem de uma oficina mecânica, incluindo clientes, veículos, serviços, peças, ordens de serviço, pagamentos e fornecedores.

### LIMA — Desenvolvimento Web

- **Aula 02:** fundamentos de HTML5, formatação de texto, citações, blocos de código, links e âncoras.
- **Aula 04:** imagens, favicon, atributos `alt` e `title`, proporção e estilos aplicados aos elementos.
- **Aula 05:** HTML semântico com `header`, `main`, `nav`, `section`, `article` e `footer`, além de currículo, blog, notícias, artigos e postagens.
- **Aula 06:** CSS inline, interno e externo; listas; navegação; estrutura semântica e revisão de HTML/CSS.
- **Projeto:** site de cafeteria com páginas para bebidas quentes, bebidas geladas, doces, lanches e salgados.
- **Somativa:** site institucional fictício DevSolutions, com seções de serviços, equipe, projetos e contato.

### PBE — Programação Back-End

- **Aula 01:** variáveis, tipos, operações, entrada no terminal, sistema de padaria e cálculo de IMC.
- **Aula 02:** strings, template strings, compras, troco e leitura de números.
- **Aula 03:** condicionais aplicadas a controle de entrada, notas e velocidade/multas.
- **Aula 04:** laços `for` e `while`, contadores, tabuada, menu de padaria e desafios.
- **Aula 05:** arrays, `push`, acumuladores, médias e validação de lotes por peso.
- **Aula 06:** funções, conversão de temperatura, descontos, arrays de produtos e arrays de objetos.
- **Aula 07:** módulos com `require` e `module.exports`, cálculo de frete, seguro, prazo, orçamento de oficina, garantia e desconto.
- **Aula 08:** funções e tratamento de erros com `try...catch`, incluindo entradas inválidas em sistemas interativos.
- **Aula 09:** leitura e escrita de arquivos com `fs`, conversão de JSON e controle de estoque com `estoque.json`.
- **Aula 10:** revisão e aplicação dos módulos de logística e oficina.
- **Desafios e Exercícios:** atividades de revisão sobre entradas, condicionais, laços, arrays, funções, vendas, crédito e estoque.

## Como executar

### JavaScript com Node.js

Instale o [Node.js](https://nodejs.org/) e, no PowerShell, entre na pasta PBE e instale a dependência:

```powershell
cd PBE
npm install
```

Execute um arquivo a partir da pasta `PBE`:

```powershell
node Aula01\olaMundo.js
node Aula01\imc.js
node Aula03\notas.js
node Aula04\tabuada.js
node Aula07\Logística\sistemaEntrega.js
node Aula09\consulta.js
```

Alguns programas são interativos e aguardam dados no terminal. Os arquivos de `PBE/Aula08` e alguns exercícios podem estar incompletos; confira o arquivo antes de usá-lo como exemplo.

### Páginas HTML

Abra os arquivos `.html` diretamente no navegador ou use a extensão Live Server do VS Code. Exemplos: `LIMA/Projeto/index.html` e `LIMA/Somativa/index.html`.

### Scripts SQL

Execute os arquivos `.sql` em um servidor MySQL/MariaDB, por meio de um cliente SQL ou do comando `mysql`:

```powershell
mysql -u usuario -p < "BCD\Aula05\SCRIPT_SMARTCOFFEE_LARISSA.sql"
```

No cliente MySQL, também é possível usar:

```sql
source BCD/Aula05/SCRIPT_SMARTCOFFEE_LARISSA.sql;
```

Os scripts podem conter `DROP DATABASE`, `DROP TABLE` e `TRUNCATE`. Use-os somente em bancos de teste.

## Git

```powershell
git clone URL_DO_REPOSITORIO
cd 2o_termo
git status
git add .
git commit -m "Atualiza atividades e README"
git pull origin main
git push origin main
```

Substitua `URL_DO_REPOSITORIO` pela URL do repositório e `main` pelo nome da branch utilizada, caso seja diferente.

## Autora

**Larissa Ramires**