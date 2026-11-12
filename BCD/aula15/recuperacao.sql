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