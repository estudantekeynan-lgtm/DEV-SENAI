-- Active: 1788519229089@@127.0.0.1@3306@smartcoffee_dml_keynan
-- TCL - Transação e integridade referencial 
-- Correção da Transação 


-- A transação funciona por etapas se uma delas falhar o processo pode gerar inconsistencia 



-- Sem transação: Parte do processo permanece gravado

-- Com transação: podemos confirmar ou desfazer tudo 

--Sintaxe de transação


START TRANSACTION;
INSERT ...
UPDATE ... 
INSERT ... 
SELECT ... 
COMMIT; 
-- Modelo de fincionamento da tcl 

-- Ex 1 : commit condirma as alterações feitas realizadas dentro da transação 

START TRANSACTION;
UPDATE produto 
set preco = 9.00
WHERE id_produto = 1
SELECT  nome, preco from produto;
COMMIT;



-- EX 2: roolback - desfaz as atualizações aindas não confirmadas
START TRANSACTION;
UPDATE produto
set preco = 50.00
WHERE id_produto = 1;
SELECT nome, preco from produto;

ROLLBACK;
COMMIT;

-- ex 3: save Point - ponto de salvamento 

START TRANSACTION;

UPDATE produto 
SET preco = preco * 1.05
WHERE id_categoria = 1 ;
SAVEPOINT reajuste_cafe;


UPDATE produto 
set preco = preco* 1.50 
WHERE id_categoria = 1 ;

ROLLBACK to SAVEPOINT reajuste_cafe;
COMMIT;

release SAVEPOINT reajuste_cafe;

-- CONSTRAINT - não substitui  transação
-- transação: controla um conjuto de operações
-- CONSTRAINT: impede que determinados valores invalidos sejam aceitos


-- Ex 0 - não atualiza ou restringe valores negaticos
CONSTRAINT ck_estoque_quantidade CHECK (quantidade >=0)
-- Ex 1: integriadade referencial 

CONSTRAINT fk_pedido_cliente FOREIGN KEY(id_cliente) REFERENCES clientes (id_cliente)

-- A fk ou a chave estrangeira irá impedir que o pedido aponte ou realize um cliente que não existe 


-- Ex 2: on delete 
-- Restric: Bloqueia exclusão com dependentes 
-- Cascade: exclui dependentes 
-- Set null : remove a referencia 


CONSTRAINT fk_item_pedido FOREIGN KEY (id_pedido) REFERENCES pedido 
(id_pedido) on DELETE RESTRICT;

-- Obs: importante lembrar desses conceitos 
-- Ex3: on Update 
-- Define que ocorre com fks quando a chave referenciada é alterada 

CONSTRAINT Fk_item_pedido FOREIGN KEY (id_pedido) REFERENCES pedido 
(id_pedido) on DELETE RESTRICT on UPDATE cascade;


-- Ex 4: exclusão fisica e lógica
-- Fisica 
DELETE FROM produto WHERE id_produto = 4 

--Logica 
UPDATE produto
SET ativo = FALSE
WHERE id_produto = 10 
SELECT * FROM produto WHERE id_produto = 4


--EX6: pedido completo 
START TRANSACTION;
INSERT INTO pedido (data_pedido,status_pedido,valor_total,id_cliente) VALUES (NOW(),'Aberto',0.00,20);
set @pedido = LAST_INSERT_ID();
INSERT INTO item_pedido (id_pedido,id_produto,quantidade,preco_unitario) VALUES(@pedido,1,2,8.00),(@pedido,5,2,8.50);
INSERT INTO pagamento (id_pedido,valor,id_forma_pagamento) VALUES(@pedido,23.00);

COMMIT;
--Fim do pedido 

-- Utilizando constraint em uma tabela 

CREATE Table estoque(
    id_estoque INT AUTO_INCREMENT,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 0,
    constraint pk_estoque PRIMARY KEY (id_estoque),
    constraint uq_estoque_produto UNIQUE (id_produto),
    constraint ck_estoque_quantidade check (quantidade >=10),
    constraint fk_estoque_produto Foreign Key (id_produto) REFERENCES produto (id_produto) on update CASCADE on delete RESTRICT
);