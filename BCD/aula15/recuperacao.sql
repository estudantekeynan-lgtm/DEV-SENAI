-- Active: 1794483871965@@127.0.0.1@3308@retrogame_recuperacao_keynan
CREATE DATABASE if not EXISTS retrogame_recuperacao_Keynan;

use retrogame_recuperacao_Keynan;


--2
CREATE TABLE IF NOT EXISTS CLIENTE (
    id_cliente INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL,
    telefone VARCHAR(20) NULL,
    ativo BOOLEAN DEFAULT TRUE,
    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente),
    CONSTRAINT uq_cliente_email UNIQUE (email)
);

--3
CREATE TABLE IF NOT EXISTS PLATAFORMA (
    id_plataforma INT AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    CONSTRAINT pk_plataforma PRIMARY KEY (id_plataforma),
    CONSTRAINT uq_plataforma_nome UNIQUE (nome)
);


CREATE TABLE IF NOT EXISTS CATEGORIA (
    id_categoria INT AUTO_INCREMENT,
    descricao VARCHAR(80) NOT NULL,
    CONSTRAINT pk_categoria PRIMARY KEY (id_categoria),
    CONSTRAINT uq_categoria_descricao UNIQUE (descricao)
);


--4

CREATE Table if not exists jogo (
    id_jogo int AUTO_INCREMENT,
    titulo VARCHAR(150) not NULL,
    codigo VARCHAR (15) not NULL,
    ano_lancamento INT NOT NULL,
    quantidade_disponivel INT DEFAULT 0 CHECK (quantidade_disponivel >= 0),
    constraint pk_jogo PRIMARY KEY (id_jogo),
    constraint uq_jogo_cod UNIQUE (codigo),
    id_plataforma INT NOT NULL,
    constraint fk_plataforma_jogo FOREIGN KEY (id_plataforma) REFERENCES plataforma (id_plataforma),
    id_categoria int not NULL,
    constraint fk_categoria_jogo FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
);


-- 5 

CREATE TABLE IF NOT EXISTS LOCACAO (
    id_locacao INT AUTO_INCREMENT,
    data_retirada DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE NULL,
    status_locacao VARCHAR(20) DEFAULT 'ABERTA',
    id_cliente INT NOT NULL,
    id_jogo INT NOT NULL,
    CONSTRAINT pk_locacao PRIMARY KEY (id_locacao),
    CONSTRAINT chk_locacao_status   CHECK (status_locacao IN ('ABERTA', 'DEVOLVIDA', 'ATRASADA')),
    CONSTRAINT fk_locacao_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_locacao_jogo FOREIGN KEY (id_jogo) REFERENCES JOGO(id_jogo)  ON UPDATE CASCADE ON DELETE RESTRICT
);

-- 6    

ALTER Table jogo ADD  desenvolvedora VARCHAR(100);


-- 7 
INSERT INTO cliente VALUES 
(DEFAULT,'Keynan','keynan@gmail.com','19999999',DEFAULT),
(DEFAULT,'Bruno','bruno@gmail.com',NULL,FALSE),
(DEFAULT,'Luana','luana@gmail.com','111111111',DEFAULT),
(DEFAULT,'Julia','julia@gmail.com','22222222',DEFAULT);

SELECT*FROM cliente;

-- 8 


INSERT INTO categoria VALUES
(DEFAULT,'Foco em exploração, combate dinâmico e histórias envolventes.'),
(DEFAULT,'Foco na evolução de personagens e escolhas que afetam a narrativa.');

SELECT*FROM categoria;

INSERT into plataforma VALUES
(DEFAULT,'PC (Computador)'),
(DEFAULT,'PS5 (console)');


SELECT*FROM plataforma;


INSERT INTO jogo VALUES
(DEFAULT,'God of War Ragnarök','GWR2022',2022,3,2,1,'Santa Monica Studio'),
(DEFAULT,'Marvels Spider-Man 2','MSM22023',2023,10,2,1,'Insomniac Games'),
(DEFAULT,'The Witcher 3: Wild Hunt','TW32015',2015,7,1,2,'CD Projekt Red'),
(DEFAULT,'Cyberpunk 2077','CP2020',2020,2,1,2,'CD Projekt Red'),
(DEFAULT,'Horizon Forbidden West','HFW2022',2022,2,2,1,'Guerrilla Games'),
(DEFAULT,'Elden Ring','ER2022',2022,4,1,2,'FromSoftware');


-- 9 


INSERT INTO locacao VALUES
(DEFAULT,now (),'2026-11-24','2026-11-25',DEFAULT,2,3),
(DEFAULT,now(),'2026-11-24','2026-11-25',DEFAULT,4,1),
(DEFAULT,now(),'2026-11-24','2026-11-25',DEFAULT,3,2);

SELECT * FROM locacao;

-- 10 

UPDATE cliente 
SET telefone = '11113435'
WHERE id_cliente = 3;

-- 11 
UPDATE jogo 
SET quantidade_disponivel = quantidade_disponivel + 2
WHERE ano_lancamento >= 2000;


-- 12
INSERT INTO cliente VALUES
(DEFAULT,'teste','teste@gmail.com','1999999',DEFAULT);

DELETE FROM cliente WHERE nome = 'teste';

DELETE FROM cliente WHERE id_cliente =2;  
-- Não pode excluir pois fala que o mesmo pertence a mais de uma tabela


-- 13  

SELECT titulo,ano_lancamento,quantidade_disponivel FROM jogo;



-- 14 

 SELECT *FROM jogo WHERE quantidade_disponivel>2 ORDER BY quantidade_disponivel DESC ;


 -- 15 

 SELECT * FROM jogo WHERE titulo LIKE "%god%";


-- 16

SELECT * FROM jogo WHERE ano_lancamento BETWEEN 2020 AND 2026; 



-- 17

SELECT COUNT(*) FROM jogo; -- Possui 6 jogos diferentes
SELECT  MIN(quantidade_disponivel) as qtde_min FROM jogo; -- jogo com menos quantidade disponivel

SELECT MAX(quantidade_disponivel) as qtde_MAX FROM jogo; -- jogo com maior quantidade disponivel


-- 18 


SELECT
    L.id_locacao,
    C.nome AS cliente,
    J.titulo AS jogo,
    L.data_retirada,
    L.status_locacao
FROM LOCACAO L
INNER JOIN CLIENTE C ON C.id_cliente = L.id_cliente
INNER JOIN JOGO J ON J.id_jogo = L.id_jogo;






-- 19 

SELECT
    L.id_locacao,
    C.nome AS cliente,
    J.titulo AS jogo,
    L.data_retirada,
    L.status_locacao
FROM LOCACAO L
INNER JOIN CLIENTE C ON C.id_cliente = L.id_cliente
INNER JOIN JOGO J ON J.id_jogo = L.id_jogo
WHERE L.status_locacao = 'ABERTA';






-- 20 
SELECT
    C.id_cliente,
    C.nome AS cliente,
    COUNT(L.id_locacao) AS quantidade_locacoes
FROM CLIENTE C
INNER JOIN LOCACAO L ON L.id_cliente = C.id_cliente
GROUP BY C.id_cliente, C.nome
ORDER BY quantidade_locacoes DESC;



-- 21 
SELECT
    C.id_cliente,
    C.nome AS cliente,
    COUNT(L.id_locacao) AS quantidade_locacoes
FROM CLIENTE C
LEFT JOIN LOCACAO L ON L.id_cliente = C.id_cliente
GROUP BY C.id_cliente, C.nome
ORDER BY quantidade_locacoes DESC, C.nome;



-- 22



START TRANSACTION;
SELECT* FROM jogo;

UPDATE jogo
SET quantidade_disponivel = quantidade_disponivel - 3
WHERE id_jogo = 3;

ROLLBACK;

COMMIT;


-- 23 

START TRANSACTION;
SELECT* FROM jogo;

UPDATE jogo
SET quantidade_disponivel = quantidade_disponivel - 3
WHERE id_jogo = 3;

ROLLBACK;

-- 24 

START TRANSACTION;
SELECT* FROM jogo;

UPDATE jogo
SET quantidade_disponivel = quantidade_disponivel + 100
WHERE id_jogo = 3 and 2;

SAVEPOINT reajuste

ROLLBACK to reajuste;


-- 25



UPDATE locacao
SET status_locacao = 'Devolvida' 
WHERE id_locacao = 2;

COMMIT;
