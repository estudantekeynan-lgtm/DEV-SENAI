<div align="center">

Lógica de Programação 2

Repositório acadêmico de Análise e Desenvolvimento de Sistemas




































































</div>

Sobre o projeto

Este repositório reúne atividades, exercícios, projetos e anotações desenvolvidos durante a formação em Análise e Desenvolvimento de Sistemas. O conteúdo registra a evolução prática em lógica de programação, desenvolvimento web, banco de dados, JavaScript, Node.js e organização de projetos.

Os materiais estão separados principalmente pelas disciplinas BCD, LIMA e PBE. Também há atividades complementares em PSOF, arquivos de apoio na raiz e projetos com imagens, arquivos JSON, scripts SQL e dependências próprias.


Este é um repositório acadêmico. Alguns arquivos são exercícios independentes e podem exigir ajustes de caminho, entradas no terminal ou dependências locais para execução.

Conteúdos do repositório

BCD — Banco de Dados

Atividades de modelagem e implementação de bancos de dados relacionais, incluindo:

•
modelos conceituais, lógicos e arquivos .brM;

•
dicionários de dados e anotações de modelagem;

•
scripts SQL para criação e atualização de tabelas;

•
comandos de DDL, DML, DQL e TCL;

•
exercícios com os cenários de clínica médica, cafeteria, oficina e Smart Coffee;

•
estudos de cardinalidade e relacionamentos.

Os arquivos estão organizados em BCD/aula4, BCD/aula5, BCD/Aula6, BCD/aula_7, BCD/aula8, BCD/aula9, BCD/aula10, BCD/aula11, BCD/clinica_medica e BCD/projeto-Smartcoffe.

LIMA — Linguagem de Marcação

Projetos e exercícios de desenvolvimento de páginas web com HTML e CSS, incluindo:

•
estrutura básica e semântica de documentos HTML;

•
listas, formulários e diferentes formas de aplicação de CSS;

•
páginas de currículo, notícias, artigos e postagem;

•
projetos de cardápio e o sistema Smart Coffee;

•
atividades somativas com páginas temáticas e organização visual;

•
uso de imagens, SVG, fontes, banners e componentes visuais.

Os principais materiais estão em LIMA/aula1 até LIMA/aula13, além de LIMA/aula7_somativa, LIMA/aula9-Projeto, LIMA/Aula13-somativa e LIMA/ideias.html.

PBE — Programação Back-End

Exercícios de lógica e programação com JavaScript e Node.js, incluindo:

•
variáveis, condicionais, laços e funções;

•
arrays, objetos, módulos e manipulação de arquivos;

•
entrada de dados pelo terminal com readline-sync;

•
sistemas de logística, oficina e balança;

•
exercícios com JSON para estoque, máquinas e equipamentos;

•
módulos CommonJS, organização de aplicações e revisão de fundamentos;

•
atividades das aulas 1 a 15.

A maior parte dos exercícios está em PBE/aulas_1-10 e PBE/aulas_11-20. Alguns módulos possuem um package.json próprio e devem ser executados a partir da respectiva pasta.

PSOF — Projeto e suporte

A pasta PSOF contém atividades complementares, como o arquivo organizacao.js, relacionadas à organização e prática de programação.

Tecnologias e ferramentas

Tecnologia ou ferramenta
Uso no repositório
JavaScript
Exercícios de lógica, módulos, objetos, funções e aplicações de terminal
Node.js
Execução dos projetos JavaScript no back-end
readline-sync
Leitura de dados informados pelo usuário no terminal
HTML5
Estruturação das páginas e projetos web
CSS3
Estilização, layouts, responsividade e identidade visual
Python
Exercícios introdutórios e atividades de apoio em BCD
SQL
Modelagem, criação, consulta e alteração de bancos de dados
JSON
Armazenamento de dados utilizados por exercícios em JavaScript
Git e GitHub
Versionamento, colaboração e publicação dos estudos




Organização das pastas

Plain Text


logica_de_programacao2/
├── BCD/
│   ├── aula4/                  # Modelagem inicial e clínica médica
│   ├── aula5/                  # Scripts de clínica médica e cafeteria
│   ├── Aula6/                  # Oficina: modelos, dicionário e SQL
│   ├── aula_7/                 # Exercícios de banco de dados
│   ├── aula8/                  # Cardinalidade e relacionamentos
│   ├── aula9/                  # DML e desafios
│   ├── aula10/                 # DQL e desafios de consulta
│   ├── aula11/                 # TCL
│   ├── clinica_medica/         # Scripts da clínica médica
│   ├── projeto-Smartcoffe/     # Projeto de banco da Smart Coffee
│   ├── aula1.py                # Atividade de apoio em Python
│   └── cafeteria.sql           # Script SQL de cafeteria
├── LIMA/
│   ├── aula1/ a aula13/        # Exercícios e projetos HTML/CSS
│   ├── aula7_somativa/         # Projeto somativo
│   ├── aula9-Projeto/          # Projeto Smart Coffee
│   ├── Aula13-somativa/        # Projeto web temático
│   └── ideias.html             # Anotações e ideias para páginas
├── PBE/
│   ├── aulas_1-10/             # Fundamentos, desafios e sistemas
│   └── aulas_11-20/            # Exercícios avançados e revisão
├── PSOF/
│   └── organizacao.js          # Atividade complementar
├── instalações.js              # Arquivo de apoio da raiz
├── package.json                # Dependência comum do projeto
├── package-lock.json            # Versões resolvidas das dependências
└── README.md                   # Documentação do repositório



Como executar

Pré-requisitos

Instale:

•


Node.js e npm para os exercícios JavaScript;

•


Python para os arquivos .py;

•
um SGBD compatível, como MySQL ou MariaDB, para executar os scripts SQL;

•
um navegador moderno para abrir os projetos HTML.

Confira as versões instaladas:

Bash


node --version
npm --version
python --version



Instalar as dependências

Na raiz do projeto, instale a dependência comum:

Bash


npm install



Algumas atividades possuem dependências próprias. Entre na pasta do exercício antes de instalar:

Bash


cd PBE/aulas_1-10/aula_2
npm install



Executar um exercício JavaScript

Use o caminho relativo do arquivo desejado:

Bash


node PBE/aulas_1-10/aula_1/aula1.js
node PBE/aulas_1-10/aula_7/appBalanca.js
node PBE/aulas_11-20/aula13/ex1_equipamentos.js



Para projetos com package.json próprio, execute a partir da pasta do projeto:

Bash


cd PBE/aulas_1-10/aula_5_sistemas/Logistica
npm install
node app.js



Outros exemplos:

Bash


cd PBE/aulas_1-10/aula_5_sistemas/oficina
npm install
node app.js



Bash


cd PBE/aulas_11-20/aula-15
npm install
node app.js



Executar um arquivo Python

Bash


python BCD/aula1.py



Abrir um projeto web

Abra o arquivo index.html do projeto diretamente no navegador ou utilize uma extensão de servidor local, como o Live Server no Visual Studio Code. Exemplos de entradas:

Plain Text


LIMA/aula1/Projeto/index.html
LIMA/aula9-Projeto/index.html
LIMA/Aula13-somativa/index.html



Executar scripts SQL

Os arquivos SQL devem ser executados em um banco compatível. Antes de iniciar, confira o conteúdo do script e ajuste o nome do banco, usuário e senha conforme o seu ambiente.

Exemplos de materiais:

Plain Text


BCD/clinica_medica/clinica.sql
BCD/projeto-Smartcoffe/fisico_smartCoffeeV2.sql
BCD/aula10/dql_Keynan.sql
BCD/aula11/tcl.sql



Git e GitHub

Para clonar o repositório:

Bash


git clone https://github.com/estudantekeynan-lgtm/logica_de_programacao2.git
cd logica_de_programacao2



Para registrar alterações:

Bash


git status
git add README.md
git commit -m "docs: atualiza README do repositório"
git push origin main



Para atualizar a cópia local antes de começar uma nova atividade:

Bash


git pull origin main



Evite versionar credenciais, senhas de banco, arquivos temporários e pastas node_modules. Quando possível, utilize um arquivo .gitignore para manter esses itens fora do controle de versão.

Objetivos de aprendizagem

Este projeto busca fortalecer a capacidade de:

1.
decompor problemas em etapas lógicas;

2.
escrever e testar algoritmos simples;

3.
trabalhar com variáveis, estruturas de decisão, repetição, arrays e objetos;

4.
organizar aplicações JavaScript em módulos;

5.
criar páginas web estruturadas e estilizadas;

6.
modelar bancos de dados e escrever consultas SQL;

7.
utilizar Git e GitHub para acompanhar a evolução dos projetos.

Autor

Keynan Fellipe dos Santos

Estudante de Desenvolvimento de Sistemas no SENAI Luiz Varga e aluno do SESI CE 005, com interesse em lógica de programação, desenvolvimento web, bancos de dados e construção de aplicações práticas.

•
GitHub: 

@estudantekeynan-lgtm

Licença

Este repositório possui finalidade acadêmica e educacional. Consulte o autor antes de reutilizar imagens, trabalhos ou materiais de terceiros presentes nos projetos.

<div align="center">

Obrigado por visitar este repositório!

</div>

