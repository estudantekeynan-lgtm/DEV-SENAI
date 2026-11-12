import secrets

bruh = secrets.token_hex(100000000)

print(bruh)

UPDATE JOGO
SET quantidade_disponivel = quantidade_disponivel - 1
WHERE id_jogo = 4
  AND quantidade_disponivel > 0;

-- Conferir a locacao e o estoque antes de confirmar
SELECT * FROM LOCACAO WHERE id_jogo = 4 ORDER BY id_locacao DESC LIMIT 1;
SELECT id_jogo, titulo, quantidade_disponivel
FROM JOGO WHERE id_jogo = 4;

-- Se o INSERT criou a locacao e o estoque foi reduzido, confirme:
COMMIT;
-- Se nao houver estoque ou algo estiver incorreto, use ROLLBACK
-- no lugar do COMMIT.

-- EXERCICIO 23: Demonstrar ROLLBACK
SELECT id_jogo, titulo, quantidade_disponivel
FROM JOGO WHERE id_jogo = 5;

START TRANSACTION;

UPDATE JOGO
SET quantidade_disponivel = quantidade_disponivel + 10
WHERE id_jogo = 5;

-- Conferir a alteracao temporaria
SELECT id_jogo, titulo, quantidade_disponivel
FROM JOGO WHERE id_jogo = 5;

ROLLBACK;

-- Comprovar que o estoque voltou ao valor original
SELECT id_jogo, titulo, quantidade_disponivel
FROM JOGO WHERE id_jogo = 5;

-- EXERCICIO 24: SAVEPOINT - desfazer somente a segunda alteracao
START TRANSACTION;

UPDATE JOGO
SET quantidade_disponivel = quantidade_disponivel + 3
WHERE id_jogo = 5;

SAVEPOINT depois_primeira_alteracao;

UPDATE JOGO
SET quantidade_disponivel = quantidade_disponivel + 5
WHERE id_jogo = 6;

-- Desfaz somente a alteracao feita depois do SAVEPOINT
ROLLBACK TO SAVEPOINT depois_primeira_alteracao;

-- Conferir: jogo 5 manteve +3; jogo 6 voltou ao estoque anterior
SELECT id_jogo, titulo, quantidade_disponivel
FROM JOGO
WHERE id_jogo IN (5, 6);

COMMIT;

-- EXERCICIO 25: Devolver locacao aberta, atualizar status e repor estoque
-- A locacao 1 foi criada no exercicio 9 e esta ABERTA.
START TRANSACTION;

UPDATE LOCACAO
SET status_locacao = 'DEVOLVIDA',
    data_devolucao = CURDATE()
WHERE id_locacao = 1
  AND status_locacao = 'ABERTA';

UPDATE JOGO J
INNER JOIN LOCACAO L ON L.id_jogo = J.id_jogo
SET J.quantidade_disponivel = J.quantidade_disponivel + 1
WHERE L.id_locacao = 1
  AND L.status_locacao = 'DEVOLVIDA';

-- Conferir a devolucao e o estoque
SELECT
    L.id_locacao,
    C.nome AS cliente,
    J.titulo AS jogo,
    L.data_devolucao,
    L.status_locacao,
    J.quantidade_disponivel
FROM LOCACAO L
INNER JOIN CLIENTE C ON C.id_cliente = L.id_cliente
INNER JOIN JOGO J ON J.id_jogo = L.id_jogo
WHERE L.id_locacao = 1;

COMMIT;

-- ANALISE TECNICA OBRIGATORIA

-- (a) Email repetido:
-- UNIQUE em CLIENTE.email impede dois clientes com o mesmo email.

-- (b) Codigo de jogo repetido:
-- UNIQUE em JOGO.codigo impede codigos duplicados.

-- (c) Estoque negativo:
-- CHECK (quantidade_disponivel >= 0) impede valores negativos.
-- UPDATEs de locacao tambem usam WHERE quantidade_disponivel > 0.

-- (d) Locacao de cliente inexistente:
-- FOREIGN KEY de LOCACAO.id_cliente exige cliente cadastrado.

-- (e) Exclusao de jogo com historico:
-- ON DELETE RESTRICT na FK de LOCACAO impede apagar jogo referenciado.

-- (f) Locacao gravada sem baixa de estoque:
-- A insercao da locacao e a baixa devem ocorrer na mesma transacao.
-- COMMIT confirma as duas; ROLLBACK desfaz as duas.

-- (g) Locacao sem unidades disponiveis:
-- A verificacao quantidade_disponivel > 0 impede inserir locacao sem estoque.
-- O bloqueio SELECT ... FOR UPDATE ajuda a evitar conflitos simultaneos.

-- Diferenca:
-- Restricoes do banco (PK, FK, UNIQUE, NOT NULL e CHECK) protegem os dados.
-- Transacoes (START TRANSACTION, COMMIT, ROLLBACK e SAVEPOINT) garantem
-- que um conjunto de operacoes seja confirmado ou desfeito de forma segura.
-- Validacoes da aplicacao complementam o banco, apresentando mensagens ao usuario.
    