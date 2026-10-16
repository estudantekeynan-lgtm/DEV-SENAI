--  Ex 1: SELECT simples 
-- SELECT coluna;
-- from tabela;

SELECT * FROm clientes;
--Consulta todas as colunas da tabela


SELECT nome,telefone FROM clientes;


SELECT nome,ativo FROM produto;

--Consulta dados com varias colunas 



-- Ex2: consultando e personalizando a consulta



SELECT nome as Nome_Cliente, telefone as Contato_cliente
from clientes;


SELECT nome,preco,preco *10 as preco_ajustado
FROM produto;



--Ex 3 : DISTINCT - eliminar repetições


SELECT DISTINCT cidade
FROM clientes;


SELECT cidade FROM clientes;




-- Com o DISTINCT cada resultado é apresentado uma unica vez
-- sem o DISTINCT cada resultado é apresentado varias vezes


-- Ex 4 : uso de WHERE - filtro de registros
-- Inserir condições e utilizar operadores de comparação

--  = Igual
--  <> ou ! = Diferente
--  > = maior que 
--  < = menor que 
 SELECT nome, preco FROM produto WHERE preco > 15;

 -- Consultar precos que possuem valores acima de 15 reais


 SELECT nome, preco FROM produto WHERE ativo = TRUE;


 -- Consultar produtos ativos/inativos
 SELECT id_pedido, data_pedido, valor_total
 FROM pedido WHERE valor_total > 25;



-- Ex 5: uso de and, or e not


-- and - Todas as condições verdadeira

Select nome,preco from produto WHERE preco > 8 and preco <25;



-- or = uma das condições precisam ser verdadeiras 


SELECT nome,cidade FROM clientes WHERE cidade = 'Limeira' or cidade = 'rondonia';




-- NOT criar uma condição de negação 


SELECT nome, cidade FROM clientes WHERE not cidade ='Limeira';


-- and e or juntos precisamos inserir ()

SELECT nome,cidade , ativo From clientes
WHERE ativo = TRUE AND (cidade='limeira' OR cidade ='Piracicaba');


-- Ex 6: BETWEEN - pesquisar por intervalos
-- Limite inicial e final


SELECT nome, preco FROM produto WHERE preco BETWEEN 8.00 and 15.00;
-- Consulta o intervalo de valores


SELECT id_pedido, data_pedido, valor_total FROM pedido WHERE data_pedido BETWEEN '2026-09-01 00:00:00' AND '2026-10-30 23:59:59';

-- Consultar entre um intervalo de tempo 
-- Ex 7: in para muitas possibilidades

SELECT nome,cidade from clientes WHERE cidade IN('Limeira','Piracicaba','Rondonia');


SELECT nome, cidade FROM clientes WHERE cidade NOT IN ('Limeira','Piracicaba');

-- Ex 8: LIKE - pesquisa por texto 

-- Coringas 
-- % Vários caracters  
-- _ apenas um caracter 


SELECT nome FROM produto WHERE nome LIKE 'Café%';
-- Consulta pela palavra que deseja e qual começa

SELECT nome FROM produto
WHERE nome LIKE '%Chocolate';

--Consulta pela palavra que termina com chocolate

SELECT nome FROM clientes
WHERE nome LIKE '%Silva%';

-- Consulta exatamente o nome


SELECT nome FROM produto WHERE nome LIKE '%o_o%';
-- Quando eu não sei a palavra inteira, ele consulta as letras inseridas 


-- Ex 9: Null ausencia de valor 

SELECT nome, telefone FROM clientes WHERE telefone is NULL;
SELECT nome, telefone FROM clientes WHERE telefone is not NULL;

-- SELECT nome, telefone FROM clientes WHERE telefone = NULL -- ERRADO


-- Ex 10 : ORDER BY - ordenar resultados

-- ASC é crescente 
-- Desc é decresente



SELECT nome,preco FROM produto ORDER BY preco ASC;
SELECT nome,preco FROM produto ORDER BY preco DESC;



SELECT nome, preco FROM produto ORDER BY nome ASC, preco  DESC;

-- Ordenar por mais de uma coluna


-- 11 Limit determinar uma quantidade de linhas


SELECT nome, preco FROM produto ORDER BY preco desc LIMIT 5;



SELECT nome,preco FROM produto ORDER BY nome LIMIT 5 OFFSET 5;



-- Ex 12: calculos em colunas 

SELECT nome,preco,preco * 1.2 as Preco_reajuste
from produto;

SELECT id_item, quantidade, preco_unitario, quantidade * preco_unitario as subtotal from item_pedido;


-- Ex 13: Funções 
    -- TEXTOS

SELECT UPPER(nome) as NOME_M, LOWER(cidade) as cidade_m
FROM clientes;
-- Uso de maiusculo e minusculo


SELECT CONCAT(nome,'    |   ',cidade) as cliente_cidade from clientes;


-- Números
SELECT nome, preco , ROUND (preco * 0.90,2) as preco_desconto FROM produto;

-- Datas

SELECT id_pedido, data_pedido, valor_total, DATE(data_pedido) as DATAS, MONTH (data_pedido) as Mês, YEAR (data_pedido) as ano, DAY (data_pedido) as dia, TIME (data_pedido) as horario FROM pedido;


-- Substituir o null por resultado com coalesce


SELECT nome, COALESCE(telefone,'Não informado') as telefone FROM clientes;


-- Ex 14: função de agregação

 count = contar uma quantidade 
 Sum = somar valores 
 avg = calcular media
 min = Valor minimo
 max = valor maximo 


 SELECT COUNT(*) as total_cliente from clientes; 
 -- quantos clientes possuem na tabela 

 SELECT ROUND(AVG(preco),2) as Media_preco FROM produto;

 -- Medias do preco dos produtos 

 SELECT MIN(preco) as preços_baixos,
 max(preco) as preço_alto,
 ROUND(AVG(preco),2) as media_de_precos 
 FROM produto;


SELECT SUM(valor_total) as faturamento
FROM pedido
WHERE status_pedido = 'Preparando';


SELECT  cidade,COUNT(*) as qtde_clientes
from clientes
GROUP BY cidade;

SELECT id_categoria, COUNT(*) as qtde_produtos
FROM produto
GROUP BY id_categoria;

--Quantidade de produtos por categoria

-- WHERE filtra linhas antes do agrupamento
-- Having filtra linhas depois do group by

SELECT cidade , COUNT(*) as qtde_clientes
from clientes
GROUP BY cidade
HAVING COUNT(*) >= 2;

--cidade com pelo menos 2 clientes

-- EX 17 resumo de uma consulta completa

SELECT colunas
from tabela
where condição 
GROUP BY coluna_agrupar
ORDER BY colunas
LIMIT quantidade
 

 -- Parte II - Relações entre entidades


 -- Joins - Consulta de entidades relacionadas
 -- Inner join - retorna registros que possuem correspondência entre duas tabelas



 --Ex 1 : pedidos com o nome do cliente


 SELECT P.Id_pedido, P.Data_pedido, C.Nome as cliente, P.Valor_total
 from pedido as P
 INNER JOIN clientes AS C  
 ON C.id_cliente = P.id_cliente;


 --OBS: Relacione o cliente cujo ID_cliente é igual ID_cliente feito no pedido

 -- Apelidos como referencia ou alias - P e C Sao aliases que deixam a consulta com várias tabelas mais curtas e legiveis.


 --Left Join mantem todos os registros da esquerda , mesmo sem correspondencia ma direita
 --Ex2: todos os clientes, inclusive quem nunca comprou


 SELECT C.nome , P.Id_pedido, P.Data_pedido
 FROM clientes as C 
 LEFT JOIN pedido as p 
 ON P.id_cliente = C.id_cliente
 ORDER BY C.nome;


 --EX 2.1 : clientes sem pedidos

 SELECT C.id_cliente, C.Nome 
 from clientes as C 
 LEFT JOIN pedido as p 
 on p.id_cliente =C.id_cliente
 WHERE p.data_pedido is NULL; 


--JOIN com 3 tabelas
--Ex 3 : itens de pedido com nome de produto

SELECT P.id_pedido, PR.nome as produto, IP.Quantidade, Ip.Preco_unitario, Ip.Quantidade * Ip.preco_unitario as subtotal
FROM pedido as P 
INNER JOIN item_pedido as IP  
on IP.id_pedido = P.id_pedido
INNER JOIN produto as PR  
on PR.id_produto = IP.id_produto
ORDER BY P.id_pedido;

-- EX 3.1 Produto e nome da sua categoria


SELECT PR.nome as Produto, Ca.nome as Categoria , Pr.Preco 
from produto as PR 
INNER JOIN categoria AS Ca  
ON Ca.id_categoria = PR.id_categoria
ORDER BY Ca.nome, pr.nome ;




-- Agregações e JOIN categoria
-- Ex 4.1 - Quantidade de produtos por categoria 


SELECT ca.nome as categoria, COUNT(pr.Id_produto) as qtde_produtos
from categoria as Ca 
LEFT JOIN produto as pr 
on pr.id_categoria = Ca.id_categoria
GROUP BY ca.id_categoria,ca.nome 
ORDER BY qtde_produtos DESC;



-- Ex 4.2 - total de compras por cliente

SELECT C.nome as cliente, COUNT(P.Id_pedido) as qtde_pedidos, sum(P.Valor_total) as total_comprado 
FROM clientes as c 
INNER JOIN pedido as P 
ON p.id_cliente = C.id_cliente  
WHERE p.status_pedido ='PREPARANDO'
GROUP BY C.id_cliente, C.nome 
ORDER BY total_comprado DESC;


--Relatorio completo do pedido 


-- EX 5: Varias entidades ou tabela em uma consulta de relatorio 


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


--Case - Criar classificações em resultados 
--Ex 6: (CASE) permite criar classificações Baseadas em regras 


SELECT nome,preco, 
CASE 
    WHEN preco < 8.00 THEN 'Economico'  
    WHEN preco < 15.00 THEN 'Intermediario'  
    ELSE  'Premium'
END as faixa_precos
FROM produto 
ORDER BY preco;



-- Ex 7 é uma consulta dentro de uma consulta


-- produtos acima do preco medio 

SELECT nome,preco 
FROM produto
WHERE preco >(SELECT AVG(preco)from produto)
ORDER BY preco DESC;