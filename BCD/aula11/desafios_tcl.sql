-- Active: 1788519229089@@127.0.0.1@3306@smartcoffee_dml_keynan
SELECT nome,preco FROM produto WHERE id_produto = 4;
# ==== 1 ====
START TRANSACTION ;

UPDATE produto
SET preco = preco *1.20
WHERE id_produto = 4;
SAVEPOINT reajuste_pudim;

ROLLBACK;
# ===== 2 ======

START TRANSACTION ;

UPDATE produto
SET preco = preco *1.20
WHERE id_produto = 4;
SAVEPOINT reajuste_pudim;
COMMIT;
ROLLBACK;

--- 3 ---

START TRANSACTION ;

UPDATE produto
SET preco = preco *1.50
WHERE id_produto = 4;
SAVEPOINT reajuste_pudim2;
COMMIT;
ROLLBACK to SAVEPOINT reajuste_pudim2;
-- O resultado foi que o preco foi reajustado 2 vezes porem conseguimos retornar ao valor anterior por conta do rollback


---- 4 ----

START TRANSACTION;
INSERT INTO pedido (data_pedido,status_pedido,valor_total,id_cliente) VALUES (NOW(),'Aberto',0.00,20);
set @pedido = LAST_INSERT_ID();
INSERT INTO item_pedido (id_pedido,id_produto,quantidade,preco_unitario) VALUES(@pedido,1,2,8.00),(@pedido,5,2,8.50);


COMMIT;



