# 2º Termo - Repositório de Atividades

Este repositório reúne as atividades práticas desenvolvidas no segundo termo, organizadas em três áreas principais:

- BCD: Banco de Dados e modelagem conceitual;
- LIMA: Linguagem de Marcação e desenvolvimento web com HTML/CSS;
- PBE: Programação Back-End com JavaScript e Node.js.

O objetivo do projeto é centralizar exercícios, desafios, arquivos de apoio, scripts SQL e páginas web produzidos durante as aulas, facilitando a consulta, execução e revisão do conteúdo ao longo do curso.

## Tecnologias utilizadas

- HTML5
- CSS3
- JavaScript
- Node.js
- SQL e MySQL/MariaDB
- brModelo (`.brM`) para modelagem conceitual
- Git e GitHub
- Visual Studio Code
- Módulo nativo `fs` e arquivos JSON
- Dependências extras como `readline-sync` em alguns scripts

## Estrutura do projeto

```text
2o_termo/
├── BCD/
│   ├── Aula04/
│   │   ├── DOCUMENTACAO_CLINICA_MEDICA_PROJETO.brM
│   │   ├── MODELOS_RELACIONAMENTOS_CONCEITUAL.brM
│   │   ├── SCRIPT_CLINICA_MEDICA.sql
│   │   ├── SMARTCOFFEE_CONCEITUAL.brM
│   │   └── Tabelas_clinica_medica.sql
│   ├── Aula05/
│   │   ├── DOCUMENTACAO_CLINICA_MEDICA_PROJETO.brM
│   │   ├── OFICINA_SOMATIVA_LARISSA.brM
│   │   ├── SCRIPT_ATIVIDADE_CLINICA_MEDICA.sql
│   │   ├── SCRIPT_ATIVIDADE_CLINICA_MEDICA2.sql
│   │   ├── SCRIPT_SMARTCOFFEE_LARISSA.sql
│   │   └── SMARTCOFFEE_CONCEITUAL.brM
│   ├── Aula06/
│   │   └── sesi_extensaovsTA.sql
│   ├── MODELOS_RELACIONAMENTOS_CONCEITUAL.brM
│   ├── Smartcoffee/
│   │   ├── SCRIPT_SMARTCOFFEE_LARISSA.sql
│   │   ├── SMARTCOFFEE_CONCEITUAL.brM
│   │   └── Smartcoffee_larissa.sql
│   └── Somativa/
│       ├── OFICINA_SOMATIVA_LARISSA.brM
│       ├── SCRIPT_OFICINA_LARISSA.sql
│       └── Imagens/
│
├── LIMA/
│   ├── Aula02/
│   │   ├── index.html
│   │   └── index2.html
│   ├── Aula04/
│   │   ├── index.html
│   │   ├── index2.html
│   │   └── Imagens/
│   ├── Aula05/
│   │   ├── artigosRapidos.html
│   │   ├── curriculo.html
│   │   ├── index.html
│   │   ├── indexNovo.html
│   │   ├── noticias.html
│   │   ├── semantico.html
│   │   └── ultimasPostagens.html
│   ├── Aula06/
│   │   ├── atividadeLista.html
│   │   ├── atividadeRevisao.html
│   │   ├── indexExterno.html
│   │   ├── indexInline.html
│   │   ├── indexInterno.html
│   │   ├── indexListas.html
│   │   ├── revisao.css
│   │   └── style.css
│   ├── Projeto/
│   │   ├── bebidas_geladas.html
│   │   ├── bebidas_quentes.html
│   │   ├── doces.html
│   │   ├── index.html
│   │   ├── lanches.html
│   │   ├── salgados.html
│   │   └── Imagens/
│   ├── Somativa/
│   │   ├── index.html
│   │   ├── style.css
│   │   └── Imagens/
│   ├── index.html
│   └── index2.html
│
├── PBE/
│   ├── Aulas-01a10/
│   │   ├── Aula01/
│   │   │   ├── app.js
│   │   │   ├── imc.js
│   │   │   ├── olaMundo.js
│   │   │   ├── padaria.js
│   │   │   ├── produtos.js
│   │   │   └── variaveis.js
│   │   ├── Aula02/
│   │   │   ├── padariaNova.js
│   │   │   └── strings.js
│   │   ├── Aula03/
│   │   │   ├── balada.js
│   │   │   ├── notas.js
│   │   │   └── velocidade.js
│   │   ├── Aula04/
│   │   │   ├── contador.js
│   │   │   ├── contadorFor.js
│   │   │   ├── ex1.js
│   │   │   ├── menuPadaria.js
│   │   │   ├── tabuada.js
│   │   │   └── Desafios/
│   │   │       ├── desafioEtanol.js
│   │   │       ├── desafioFoguete.js
│   │   │       └── desafioNatacao.js
│   │   ├── Aula05/
│   │   │   ├── array.js
│   │   │   └── array2.js
│   │   ├── Aula06/
│   │   │   ├── exercicio.js
│   │   │   ├── exercicio2.js
│   │   │   ├── exercicio3.js
│   │   │   ├── exercicio4.js
│   │   │   └── exercicio5.js
│   │   ├── Aula07/
│   │   │   ├── Logística/
│   │   │   │   ├── calculadoraFrete.js
│   │   │   │   └── sistemaEntrega.js
│   │   │   └── Oficina/
│   │   │       ├── app.js
│   │   │       └── funcoesOficina.js
│   │   ├── Aula08/
│   │   │   ├── funcoesBalanca.js
│   │   │   ├── trycat.js
│   │   │   ├── trycat2.js
│   │   │   ├── trycat3.js
│   │   │   └── trycat4.js
│   │   └── Aula09/
│   │       ├── consulta.js
│   │       ├── estoque.json
│   │       ├── funcionarios.js
│   │       └── lojaFerramentas.js
│   ├── Atividades/
│   │   ├── Atividade 1/
│   │   │   ├── app.js
│   │   │   └── conversor.js
│   │   ├── Atividade 2/
│   │   │   ├── geometria.js
│   │   │   └── main.js
│   │   ├── Atividade 3/
│   │   │   ├── principal.js
│   │   │   └── sensor.js
│   │   ├── Atividade 4/
│   │   │   ├── caixa.js
│   │   │   └── calculosVenda.js
│   │   ├── Atividade 5/
│   │   │   └── array.js
│   │   └── Atividade 6/
│   │       └── array.js
│   ├── Desafios/
│   │   ├── desafio.js
│   │   ├── desafio1.js
│   │   ├── desafio2.js
│   │   ├── desafio3.js
│   │   ├── desafio4.js
│   │   └── desafio5.js
│   ├── Exercicios/
│   │   ├── app5.js
│   │   ├── array.js
│   │   ├── array2.js
│   │   ├── ex1.js
│   │   ├── ex2.js
│   │   ├── ex3.js
│   │   ├── ex4.js
│   │   ├── ex5.js
│   │   ├── exercicio.js
│   │   ├── exercicio2.js
│   │   ├── exercicio3.js
│   │   ├── exercicio4.js
│   │   └── exercicio5.js
│   └── node_modules/
│
├── README.md
├── texto_para_gerar_readme
└── .git/
```

## Resumo das atividades por área

### BCD — Banco de Dados

- `Aula04`: criação de modelos conceituais e scripts iniciais para a clínica médica e para o projeto SmartCoffee, incluindo tabelas, relacionamentos e documentação.
- `Aula05`: aprofundamento em SQL com comandos como `CREATE`, `ALTER`, `INSERT`, `SELECT`, `TRUNCATE`, `DROP`, além de scripts para clínica, SmartCoffee e oficina.
- `Aula06`: estudo do banco `sesi_extensaovsTA`, com exploração de tabelas, schemas e estrutura do banco.
- `Smartcoffee`: materiais específicos do projeto de cafeteria, com scripts SQL e modelos conceituais do sistema.
- `Somativa`: atividade final de modelagem para uma oficina, com foco em clientes, veículos, serviços, peças, ordens de serviço, pagamentos e fornecedores.

### LIMA — Desenvolvimento Web

- `Aula02`: introdução ao HTML com formatação de texto, links, imagens, citações e estrutura básica de páginas.
- `Aula04`: uso de imagens, favicon, atributos `alt` e `title`, além de ajustes visuais e apresentação dos elementos.
- `Aula05`: páginas com HTML semântico, desenvolvimento de currículo, blog, notícias, artigos e páginas de postagem.
- `Aula06`: exercícios com CSS inline, interno e externo, listas, navegação e revisão de HTML/CSS.
- `Projeto`: site de cafeteria com páginas para bebidas, doces, lanches e salgados.
- `Somativa`: projeto final de site institucional, com seção de serviços, equipe, projetos e contato.

### PBE — Programação Back-End

- `Aula01`: variáveis, tipos, operações, entrada no terminal, cálculo de IMC, sistema de padaria e primeiros exercícios.
- `Aula02`: manipulação de strings, template strings, padaria nova e operações com texto e números.
- `Aula03`: condicionais, notas, velocidade, multas e lógica de fluxo com estruturas `if`/`else`.
- `Aula04`: laços de repetição, contadores, tabuada, menu de padaria e desafios com laços.
- `Aula05`: arrays, operações com elementos e exercícios de organização de dados.
- `Aula06`: funções, conversões, descontos, arrays de produtos e exercícios de revisão.
- `Aula07`: modularização com `require` e `module.exports`, além de módulos de logística e oficina.
- `Aula08`: funções, validações e tratamento de erros com `try...catch`.
- `Aula09`: leitura e escrita de arquivos, manipulação de JSON e controle de estoque.
- `Atividades`: exercícios complementares de 1 a 6, com foco em lógica, arrays, funções e operações práticas.
- `Exercicios`: conjunto adicional de exercícios de JavaScript para revisão e prática.
- `Desafios`: desafios diversos de lógica, cálculo, estrutura e programação.

## Como executar os arquivos com Node.js

### 1) Verifique o Node.js

Certifique-se de ter o Node.js instalado no sistema. Em seguida, abra o terminal e navegue até a pasta do projeto.

### 2) Executar arquivos JavaScript da pasta PBE

Exemplos de execução:

```powershell
cd PBE
node Aulas-01a10\Aula01\olaMundo.js
node Aulas-01a10\Aula01\imc.js
node Aulas-01a10\Aula03\notas.js
node Aulas-01a10\Aula04\tabuada.js
node Aulas-01a10\Aula07\Logística\sistemaEntrega.js
node Aulas-01a10\Aula09\consulta.js
```

Alguns programas dependem de entrada do usuário no terminal e podem solicitar valores durante a execução.

### 3) Scripts que usam dependências extras

Se algum arquivo exigir módulos externos, como `readline-sync`, instale a dependência no diretório correspondente:

```powershell
npm install readline-sync
```

> Observação: no workspace atual, o diretório `PBE` contém `node_modules`, mas não há um `package.json` visível na raiz dessa pasta. Caso ocorra erro de módulo, verifique a dependência necessária e instale-a localmente.

## Como abrir as páginas HTML

As páginas da pasta `LIMA` podem ser abertas diretamente no navegador ou por meio da extensão Live Server do VS Code.

Exemplos:

- `LIMA/Projeto/index.html`
- `LIMA/Somativa/index.html`
- `LIMA/Aula05/index.html`

## Como executar os scripts SQL

Os arquivos de `BCD` podem ser executados em um banco MySQL/MariaDB por meio de um cliente SQL ou do comando `mysql`.

Exemplo de execução via terminal:

```powershell
mysql -u usuario -p < "BCD\Aula05\SCRIPT_SMARTCOFFEE_LARISSA.sql"
```

Outra opção no cliente MySQL:

```sql
source BCD/Aula05/SCRIPT_SMARTCOFFEE_LARISSA.sql;
```

> Atenção: alguns scripts podem conter operações como `DROP DATABASE`, `DROP TABLE` e `TRUNCATE`. Utilize-os somente em ambientes de teste ou em bancos que possam ser resetados.

## Instruções de Git

### Clonar o repositório

```powershell
git clone URL_DO_REPOSITORIO
cd 2o_termo
```

### Verificar o estado do projeto

```powershell
git status
```

### Adicionar, confirmar e enviar alterações

```powershell
git add .
git commit -m "Atualiza atividades e README"
git push origin main
```

Se a branch principal tiver outro nome, substitua `main` pelo nome correto.

### Atualizar o repositório local

```powershell
git pull origin main
```

## Autor

Larissa Ramires
