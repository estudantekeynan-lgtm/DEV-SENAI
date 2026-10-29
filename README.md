# Lógica de Programação 2

Repositório acadêmico com exercícios e projetos desenvolvidos ao longo do curso de Desenvolvimento de Sistemas. O conteúdo reúne práticas de programação back-end, desenvolvimento de páginas web e bancos de dados, além de atividades complementares.

## Tecnologias

- **JavaScript e Node.js** para lógica, programas de terminal, módulos e leitura de arquivos.
- **readline-sync** para receber dados pelo terminal em vários exercícios.
- **HTML5 e CSS3** para páginas, layouts e projetos web.
- **SQL** para criação, consulta e alteração de bancos de dados relacionais.
- **JSON** para armazenar dados usados por exercícios em JavaScript.
- **Python** em exercícios introdutórios.
- **Git e GitHub** para controle de versão e compartilhamento do projeto.

## Estrutura do repositório

```text
logica_de_programacao2/
├── BCD/                         # Banco de Dados
│   ├── aula1.py
│   ├── aula4/ ... aula_12/       # Exercícios e scripts SQL
│   ├── clinica_medica/
│   └── projeto-Smartcoffe/
├── LIMA/                        # Linguagem de Marcação
│   ├── aula1/ ... aula3/
│   ├── aula6/ ... aula12/
│   └── Aula13-somativa/
├── PBE/                         # Programação Back-End
│   ├── aulas_1-10/
│   └── aulas_11-20/
├── PSOF/                        # Programação e organização de sistemas
│   └── Projeto-01/
├── instalações.js
├── package.json
└── README.md
```

As pastas representam disciplinas e aulas; dentro delas, os arquivos podem estar separados por exercícios, desafios ou projetos. Nem todas as aulas possuem uma pasta ou arquivo neste repositório.

## Conteúdo das aulas e projetos

### BCD — Banco de Dados

Os arquivos desta disciplina incluem atividades de modelagem e scripts SQL. As aulas com materiais encontrados abordam:

| Aula/pasta | Resumo |
| --- | --- |
| `aula1.py` | Registro de dados e identificação de campos e tipos de dados. |
| `aula4` | Criação e atualização de tabelas para um banco de clínica médica; há anotações sobre tipos e restrições. |
| `aula5` | Continuação do banco da clínica e criação de tabelas para uma cafeteria. |
| `Aula6` | Modelagem e criação das tabelas de um banco para oficina. |
| `aula_7` | Scripts de criação e extensão de estruturas de banco de dados. |
| `aula8` | Cardinalidade e relacionamentos entre entidades, com tabelas de clientes e pedidos. |
| `aula9` | DML: criação/preparação de dados e exercícios de manipulação de registros. |
| `aula10` | DQL: consultas e desafios de consulta em SQL. |
| `aula11` | TCL e comandos de controle de transações. |
| `aula_12` | Indexação e normalização de banco de dados. |

Também há scripts e versões de banco de dados para clínica médica, cafeteria e o projeto Smart Coffee.

### LIMA — Linguagem de Marcação

As atividades praticam a construção e a apresentação de páginas web:

| Aula/pasta | Resumo |
| --- | --- |
| `aula1` | Estrutura HTML e site Smart Coffee com páginas de cardápio, equipe, estoque, funcionários, pedidos e fidelidade. |
| `aula2` | Páginas HTML e uso de ícones de site (favicons). |
| `aula3` | Currículo e site semântico de tecnologia, com páginas de notícias, artigos e postagens. |
| `aula6` | Revisão de HTML, listas e aplicação de CSS inline, interno e externo. |
| `aula7_somativa` | Atividade somativa de desenvolvimento de página web. |
| `aula8` | Correção/revisão da atividade somativa. |
| `aula9-Projeto` | Projeto de site Smart Coffee e página de cardápio. |
| `aula10` | Exercícios de layout com Flexbox. |
| `aula11` | Exercícios e desafio de layout com CSS Grid. |
| `aula12` | Continuação do site Smart Coffee e de seu cardápio. |
| `Aula13-somativa` | Página temática sobre histórias que atravessaram gerações. |

### PBE — Programação Back-End

Os exercícios usam principalmente JavaScript executado com Node.js. Os temas identificados nos arquivos são:

| Aula/pasta | Resumo |
| --- | --- |
| `aula_1` | Primeiros programas, operações, entrada de dados, relatório de aluno e desafios de média e compra. |
| `aula_2` | Exercícios e desafios de entrada de dados, cálculos e decisões condicionais. |
| `aula_3` | Exercícios de arrays e manipulação de conjuntos de valores. |
| `aula_4` | Exercícios e desafios de lógica e processamento de dados. |
| `aula_5_sistemas` | Sistemas de logística (frete, seguro e prazo de entrega) e oficina. |
| `aula_6` | Práticas com tratamento de erros usando `try` e `catch`. |
| `aula_7` | Sistema de balança, separado entre aplicação e funções. |
| `aula_8_ap` | Arquivo de apresentação da atividade. |
| `aula_9` | Leitura e consulta de dados de estoque e máquinas armazenados em JSON. |
| `aula_10` | Exercícios com módulos e funções reutilizáveis, incluindo conversão, geometria, sensores, caixa, peças e fábrica. |
| `avaliação-aula11` | Desafios contextualizados em produção, compras, qualidade, temperatura, estoque, eficiência e manutenção. |
| `aula-12` | Exercícios envolvendo sensores, entrada de dados e registros de ferramentais. |
| `aula13` | Consultas e relatórios sobre equipamentos, máquinas, sensores, estoque, temperatura, produção, RH e manutenção, com arquivos JSON. |
| `aula-14` | Revisão de operações com arquivos (File System) no Node.js. |
| `aula-15` | Projeto de consultas de máquinas com leitura de JSON, busca por ID, filtros por status/setor e testes. |

### PSOF — Programação e organização de sistemas

Há um exercício de organização e o `Projeto-01`, um site de catálogo de fornecedores com páginas de categorias, contato, fornecedores e apresentação do projeto.

## Como executar

### Pré-requisitos

Instale o [Node.js](https://nodejs.org/), que também inclui o npm. Confira a instalação:

```bash
node --version
npm --version
```

Na raiz do repositório, instale as dependências declaradas no `package.json`:

```bash
npm install
```

O projeto e algumas atividades declaram a dependência `readline-sync`. Algumas pastas também têm seu próprio `package.json`; para instalar as dependências de uma atividade isoladamente, entre nessa pasta e execute `npm install`.

### Executar exercícios JavaScript

Execute o arquivo desejado com `node` a partir da raiz do repositório. Por exemplo:

```bash
node PBE\aulas_1-10\aula_1\aula3.js
node PBE\aulas_1-10\aula_7\appBalanca.js
```

Para programas que usam arquivos locais ou módulos da própria atividade, entre primeiro na pasta do exercício para que os caminhos relativos funcionem:

```bash
cd PBE\aulas_1-10\aula_5_sistemas\Logistica
npm install
node app.js
```

O projeto da aula 15 inclui scripts npm:

```bash
cd PBE\aulas_11-20\aula-15
npm start
npm test
```

`npm test` executa os testes definidos em `testes.js`.

### Outros tipos de arquivo

- Abra arquivos `.html` em um navegador; para alguns projetos, também é possível usar a extensão Live Server do VS Code.
- Execute arquivos `.py` com Python, não com Node.js (por exemplo, `python BCD\aula1.py`).
- Abra arquivos `.sql` em um SGBD compatível, como MySQL ou MariaDB, e confira o banco selecionado antes de executar os scripts.

## Git e GitHub

Clone o repositório e entre na pasta do projeto:

```bash
git clone https://github.com/estudantekeynan-lgtm/logica_de_programacao2.git
cd logica_de_programacao2
```

Comandos básicos para acompanhar e enviar alterações:

```bash
git status
git add README.md
git commit -m "docs: atualiza README"
git pull origin main
git push origin main
```

Troque `README.md` pelo caminho dos arquivos que deseja adicionar. Se a branch principal do clone não se chamar `main`, use o nome da branch exibido por `git branch`.

## Autor

**Keynan Fellipe dos Santos**

Estudante de Desenvolvimento de Sistemas.
