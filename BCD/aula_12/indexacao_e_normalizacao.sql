-- Active: 1788519229089@@127.0.0.1@3306@smartcoffee_index_keynan
-- Aula 11 - Index e normalização 

-- Encontrar problemas e normalizar 



DROP DATABASE if EXISTS smartcoffee_index_keynan;
CREATE DATABASE if NOT EXISTS smartcoffee_index_keynan;


use smartcoffee_index_keynan;
CREATE Table pedido_completo(
    Id_pedido INT PRIMARY KEY,
    data_pedido DATETIME,
    cliente_nome VARCHAR (100),
    cliente_email  VARCHAR (120),
    cliente_cidade VARCHAR (80),
    produto1 VARCHAR(100),
    produto2 VARCHAR(100),
    produto3 VARCHAR(100),
    categoria1 VARCHAR (80),
    categoria2 VARCHAR (80),
    categoria3 VARCHAR (80),
    quantidade1 INT,
    quantidade2 INT,
    quantidade3 INT
);

INSERT INTO pedido_completo VALUES(1.'2026-10-01 09:10:10','Bruno Lima','Bruno@gmail.com','Limeira','Espresso','Brownie'NULL,'Cafés','Doces',NULL,2,1,NULL);



-- Correções 

CREATE Table cliente(
    id_cliente INT AUTO_INCREMENT,
    nome VARCHAR(100) not NULL,
    email VARCHAR(120) not NULL UNIQUE,
    cidade VARCHAR(80),
    constraint pk_cliente PRIMARY KEY (id_cliente)
);

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT,
    nome VARCHAR(80) not NULL UNIQUE,
    constraint pk_categoria PRIMARY KEY (id_categoria)
);

CREATE Table produto(
    id_produto INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL DEFAULT 0,
    constraint pk_produto PRIMARY KEY (id_produto),
    id_categoria int NOT NULL,
    constraint fk_categoria_produto FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
);

CREATE TABLE pedido(
    id_pedido INT AUTO_INCREMENT,
    data_pedido DATETIME NOT NULL,
    constraint pk_cliente PRIMARY KEY (id_pedido),
    id_cliente int NOT NULL,
    constraint  fk_cliente_pedido FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
    
);

CREATE TABLE item_pedido(
    id_item INT AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL check  (quantidade > 0),
    preco_unitario DECIMAL (10,2) not NULL,
    constraint pk_item_pedido_cliente PRIMARY KEY (id_item),
    constraint fk_pedido_item FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
    constraint fk_produto_item FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
);

INSERT INTO cliente VALUES(0,'Keynan Santos','keynan@gmail.com','Limeira');

SELECT * FROM cliente;

INSERT INTO categoria VALUES (DEFAULT,'Cafés');





