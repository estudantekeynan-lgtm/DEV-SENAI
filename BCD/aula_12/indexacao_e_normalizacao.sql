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

-- Formas de correção 1fn

-- Primeira correção da tabela seria eliminar grupos repetitivos como produto1,produto2,produto3 
-- A forma 1 fn faz sentindo aq por que um pedido pode possuir qualquer quantidade de itens sem criar uma coluna


-- 2 fn 

--Separar cliente,produto e categoria
-- OS dados do clientenão pertencem ao pedido. Eles descrevem o cliente. O nome categoria tambem não pode ser pedido
-- Chave é composta por (iD_pedido e ID_cliente)
-- Pedido depende de cliente
-- A 2fn aparece de forma concreta: em uma chave composta, atributos comuns depender da chave inteira 


-- Formas de correção - 3fn

-- Versão incorreta do produto

-- Nome_categoria depende de id_categoria. Portanto, ele deve estar em categoria



-- Resumo 
-- 1fn resolve grupos repetitivos
-- 2fn resolve dependencias parciais
-- 3fn remove dependencias indevidas entre atributos não-chave


-- Redundancia que deve permanecer 
-- Item_pedido.preco_unitario deve guardar o preco pratico no momento da venda


-- Mesmo que produto, preoc mude amanhã, o historico do pedido precisa continuar correto

-- Indexacao 

-- Analisamos o modelo e corrigimos, agora iremos analisar os dados

-- Ex 1: consulta por nome  do produto

SELECT nome FROM produto
WHERE nome = 'Cafés';

CREATE INDEX idx_categoria_nome on produto (nome);


SELECT data_pedido FROM pedido WHERE id_cliente = 1 and data_pedido >= '2026-10-01' ORDER BY data_pedido;

CREATE INDEX idx_pedido_cliente_data  on pedido (id_cliente,data_pedido);



-- Index não corrige tabela errada

-- Modelo errado + index = modelo mais rapido

-- modelo correto + o index justificado  = estrutura CONSISTENTe e acesso eficiente
-- SHOW index e EXPLAIN
SHOW INDEX FROM cliente;

EXPLAIN SELECT * FROM pedido
WHERE id_cliente = 1 AND data_pedido >= '2026-10-01';

-- Index melhora caminhos de acesso, mas não elimina a redundancia, dependencia parcial ou anomalia estrutural 

-- Muitos indices ocupam espaço e precisam ser atualizados em insert, update e delete. devem existir por necessidade real de consulta


CREATE TABLE fornecedor_produto_errado (
    id_fornecedor INT,
    id_produto INT,
    nome_fornecedor VARCHAR(100),
    telefone_fornecedor VARCHAR(20),
    nome_produto VARCHAR(100),
    preco_atual_produto DECIMAL(10,2),
    preco_compra DECIMAL(10,2),
    prazo_entrega_dias INT,
    PRIMARY KEY (id_fornecedor, id_produto)
);


-- EX 1: IDENTIFIQUE AS DEPENDÊNCIAS
--2fn
--3fn



-- EX 2: REESTRUTURE
CREATE TABLE fornecedor_produto_certo (
    id_fornecedor INT AUTO_INCREMENT,
    nome_fornecedor VARCHAR(100),
    telefone_fornecedor VARCHAR(20),
    constraint pk_fornecedor_produto PRIMARY KEY (id_fornecedor)
    );
CREATE TABLE ITEM_FORNECEDOR (
    ID_ITEM_F INT AUTO_INCREMENT,
    PRAZO_ENTREGA_DIAS INT,
    PRECO_COMPRA DECIMAL(10,2) DEFAULT 0,
    ID_FORNECEDOR INT NOT NULL,
    ID_PRODUTO INT NOT NULL,
    CONSTRAINT PK_ITEM_FORNECEDOR PRIMARY KEY (ID_ITEM_F),
    CONSTRAINT FK_ITEM_FORNECEDOR_FORNECEDOR FOREIGN KEY (ID_FORNECEDOR)
        REFERENCES FORNECEDOR (ID_FORNECEDOR),
    CONSTRAINT FK_ITEM_FORNECEDOR_PRODUTO FOREIGN KEY (ID_PRODUTO)
        REFERENCES PRODUTO (ID_PRODUTO)
);
-- EX 3 : crie indices para produtos e fornecedores e pedidos
DROP TABLE fornecedor_produto_certo;
CREATE INDEX idx_produtos_nome on produto (nome);
CREATE INDEX idx_fornecedor on fornecedor_produto_certo (id_fornecedor,nome_fornecedor);

CREATE INDEX idx_pedido_data_pedido on pedido(data_pedido);
-- EX 4: LISTE ÍNDICES EXISTENTES EM PRODUTOS
SHOW INDEX FROM produto;
SHOW INDEX FROM pedido;
-- EX 5: Execulto o EXPLAIN antes e depois
eXPLAIN SELECT * FROM produto
WHERE id_produto = 1 ;
-- EX 6: Explique o por que não devemps indexar todas as colunas
-- Porque nem todas as tabelas tem a necessidade de ser execultada rapidamente , e deixa nosso bcd pesado