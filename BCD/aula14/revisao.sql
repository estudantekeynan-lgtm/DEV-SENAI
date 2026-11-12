-- Active: 1794483871965@@127.0.0.1@3308@mysql
-- criar tabelas - usuario,livro,emprestimo,
CREATE DATABASE if not EXISTS biblioteca_som2_Keynan;
use biblioteca_som2_Keynan;

--2
CREATE Table usuario(
    id_usuario INT AUTO_INCREMENT,
    nome VARCHAR (100) NOT NULL,
    email VARCHAR(120) not NULL UNIQUE,
    telefone VARCHAR(20),
    ativo BOOLEAN DEFAULT true,
    constraint pk_usuario PRIMARY KEY (id_usuario)
);

--3
CREATE Table livro(
    id_livro int AUTO_INCREMENT,
    titulo VARCHAR(150) not NULL,
    autor VARCHAR (120) NOT NULL,
    isbn CHAR(13) NOT NULL UNIQUE,
    --ano_publicacao poderia ser year ou date ao invés de int ,
    ano_publicacao int,
    quantidade_disponivel INT DEFAULT 0 check (quantidade_disponivel >= 0),
    
    constraint pk_livro PRIMARY KEY (id_livro)

);

--4
CREATE Table emprestimo (
    id_emprestimo int AUTO_INCREMENT,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE not NULL,
    data_devolucao DATE,
    status_emprestimo VARCHAR(20) DEFAULT 'Aberto' check (status_emprestimo in 'Aberto','Devolvido','Atrasado'),
    constraint pk_emprestimo PRIMARY KEY (id_emprestimo),
    id_usuario INT not NULL,
    constraint fk_usuario_emprestimo FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    id_livro INT NOT NULL,
    constraint fk_livro_emprestimo FOREIGN KEY (id_livro) REFERENCES livro (id_livro)
);