-- Active: 1788519229089@@127.0.0.1@3306@biblioteca_som2_keynan

--1
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
    status_emprestimo VARCHAR(20) DEFAULT 'Aberto' check (status_emprestimo = 'Aberto'),
    constraint pk_emprestimo PRIMARY KEY (id_emprestimo),
    id_usuario INT not NULL,
    constraint fk_usuario_emprestimo FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    id_livro INT NOT NULL,
    constraint fk_livro_emprestimo FOREIGN KEY (id_livro) REFERENCES livro (id_livro)
);
-- 5
ALTER Table livro ADD editora VARCHAR(100);

-- 6


INSERT INTO usuario VALUES 
(0,'Keynan','keynan@gmail.com','19999999',DEFAULT),
(0,'Bruno','bruno@gmail.com',NULL,FALSE),
(0,'Luana','luana@gmail.com','111111111',DEFAULT),
(0,'Julia','julia@gmail.com','22222222',DEFAULT);

SELECT * FROM livro;

-- 7 
INSERT INTO livro (titulo,autor,isbn,ano_publicacao,quantidade_disponivel) VALUES
('Dom Casmurro','Machado de Assis','12345',1899, 10),
('O Pequeno Príncipe','Antoine de Saint-Exupéry','12344',1943, 1),
('1984','George Orwell','12333',1949, 3),
('Harry Potter e a Pedra Filosofal','J.K Rowling','33345',1997, 7),
('O Código Da Vinci','Dan Brown','11115',1899, 3),
('A Culpa é das Estrelas','John Green','55555',2012, 30);


-- 8 
INSERT INTO emprestimo VALUES
(0,DEFAULT,'2026-11-24','2026-11-27',DEFAULT,1,7),
(0,DEFAULT,'2026-11-24','2026-11-29',DEFAULT,2,9),
(0,DEFAULT,'2026-11-24','2026-10-22',DEFAULT,4,11);


-- 9

SELECT nome,telefone FROM usuario WHERE id_usuario = 1;

UPDATE usuario
SET telefone = '1111111111'
WHERE id_usuario = 1;


-- 10
UPDATE livro
SET quantidade_disponivel = quantidade_disponivel+2
WHERE ano_publicacao > 2000;
-- Nao tenho livros que foram lançados em 2020 , por isso a alteração dos anos 2000
SELECT* FROM livro


-- 11
INSERT INTO usuario VALUES
(0,'Ana','ana@gmail.com','14449999',DEFAULT);
SELECT * FROM usuario;
DELETE FROM usuario WHERE nome= 'Ana';
DELETE FROM usuario WHERE id_usuario = 1; -- Ele não deixa deletar o usuario pois ele possui vinculo a outra tabela



--12

SELECT titulo, autor , quantidade_disponivel FROM livro;


-- 13
SELECT *FROM livro WHERE quantidade_disponivel>2 ORDER BY quantidade_disponivel DESC ;



-- 14

SELECT * FROM livro WHERE titulo LIKE "%Harry%";



-- 15 
SELECT * FROM livro WHERE  ano_publicacao BETWEEN 1950 AND 2026; 


--16

SELECT COUNT(*) FROM livro; -- Possui 6 livros diferentes
SELECT  MIN(quantidade_disponivel) as qtde_min FROM livro; -- Livro com menos quantidade disponivel

SELECT MAX(quantidade_disponivel) as qtde_MAX FROM livro; -- Livro com mais contidades disponiveis


SELECT ROUND(AVG(quantidade_disponivel),2) qtde_media FROM livro; -- Quantidade media de livros 

SELECT SUM(quantidade_disponivel) as soma FROM livro; -- quantidade de livros do estoque 



-- 17

SELECT  ep.id_emprestimo, U.nome,L.titulo,ep.data_emprestimo,ep.status_emprestimo 
FROM emprestimo as ep 
INNER JOIN usuario as U
INNER JOIN livro as L ;




-- 18 

SELECT  ep.id_emprestimo, U.nome,L.titulo,ep.data_emprestimo,ep.status_emprestimo 
FROM emprestimo as ep 
INNER JOIN usuario as U
INNER JOIN livro as L 
WHERE status_emprestimo = 'Aberto';


-- 19









