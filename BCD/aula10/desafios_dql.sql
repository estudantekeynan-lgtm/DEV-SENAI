-- Active: 1788519229089@@127.0.0.1@3306@smartcoffee_dml_keynan
-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: Keynan 
-- Turma: 2devis Data: 09/10/2026
-- Base: smartcoffee_dql
-- ============================================================
USE smartcoffee_dml_keynan;

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.
SELECT *FROM clientes;


-- 2. Exiba apenas nome, cidade e e-mail dos clientes.

SELECT nome,cidade,email FROM clientes;


-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT cidade FROM clientes;

-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT nome,preco FROM produto ORDER BY preco ASC;


-- 5. Mostre apenas os 5 produtos mais caros.
SELECT nome, preco FROM produto ORDER BY preco desc LIMIT 5;

-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT nome,preco FROM produto WHERE preco BETWEEN 8.00 and 15.00;


-- 7. Liste os clientes das cidades Limeira ou Americana.
SELECT nome,cidade FROM clientes WHERE cidade IN ('Limeira','Americana');


-- 8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT nome FROM produto WHERE nome LIKE '%cafe%';


-- 9. Liste os clientes que não informaram telefone.
SELECT nome, telefone FROM clientes WHERE telefone is NULL;


-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.
SELECT valor_total FROM pedido WHERE status_pedido='Finalizado' and(valor_total>20.00) ORDER BY valor_total DESC;


-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.
SELECT COUNT(*) as qtde_produtos FROM produto ;


-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
SELECT MIN(preco) as preços_baixos,
 max(preco) as preço_alto,
 ROUND(AVG(preco),2) as media_de_precos 
 FROM produto;

-- 13. Informe quantos clientes existem em cada cidade.
SELECT  cidade,COUNT(*) as qtde_clientes
from clientes
GROUP BY cidade;

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.
SELECT cidade , COUNT(*) as qtde_clientes
from clientes
GROUP BY cidade
HAVING COUNT(*) >= 2;

-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.
SELECT SUM(valor_total) as faturamento
FROM pedido
WHERE status_pedido = 'Preparando';




-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.
SELECT P.id_pedido, DATE_FORMAT(P.Data_pedido, '%d %m %Y  %H:%i') as data,
c.nome as cliente, pr.nome as produto, Ip.quantidade, Ip.preco_unitario, ip.quantidade * preco_unitario as subtotal
from pedido as p 
INNER JOIN clientes as c 
on c.id_cliente = p.id_cliente
inner JOIN item_pedido as ip 
ON ip.id_pedido = p.id_pedido
INNER JOIN produto as pr 
on pr.id_produto= ip.id_produto

ORDER BY P.id_pedido, pr.nome;

-- 17. Liste cada produto acompanhado do nome de sua categoria.
SELECT Ca.nome as nome_categoria, Pr.nome as pedido
FROM categoria as Ca 
LEFT JOIN produto as Pr
on ca.id_categoria = Pr.id_categoria; 


-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.
SELECT P.id_pedido, DATE_FORMAT(P.Data_pedido, '%d %m %Y  %H:%i') as data,
c.nome as cliente, pr.nome as produto, Ip.quantidade, Ip.preco_unitario, ip.quantidade * preco_unitario as subtotal
from pedido as p 
INNER JOIN clientes as c 
on c.id_cliente = p.id_cliente
inner JOIN item_pedido as ip 
ON ip.id_pedido = p.id_pedido
INNER JOIN produto as pr 
on pr.id_produto= ip.id_produto

ORDER BY P.id_pedido, pr.nome;

-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.

 SELECT C.nome , P.Id_pedido, P.Data_pedido
 FROM clientes as C 
 LEFT JOIN pedido as p 
 ON P.id_cliente = C.id_cliente
 ORDER BY C.nome;


-- 20. Liste apenas os clientes que nunca fizeram pedidos.
 SELECT C.id_cliente, C.Nome 
 from clientes as C 
 LEFT JOIN pedido as p 
 on p.id_cliente =C.id_cliente
 WHERE p.data_pedido is NULL; 


-- PARTE E - DESAFIO GERENCIAL

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.

SELECT c.nome as nome , Ip.quantidade as qtde_pedida , Ip.quantidade * Ip.preco_unitario as subtotal
from clientes as c
LEFT JOIN item_pedido as Ip 
ON c.id_cliente = id_produto
+-
ORDER BY subtotal DESC;
-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.

SELECT nome,preco 
FROM produto
WHERE preco >(SELECT AVG(preco)from produto)
ORDER BY preco DESC;

-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.


-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.


-- 25. CONSULTA AUTORAL
-- Pergunta de negócio:
--
-- Por que essa informação é útil?
--
-- Consulta: