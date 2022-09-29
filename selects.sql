-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT
 pedidos.id,
 pedidos.status,
 pedidos.cliente_id,
 produtos.id,
 produtos.nome,
 produtos.tipo,
 produtos.preco,
 produtos.pts_de_lealdade
FROM
  produtos_pedidos
  INNER JOIN pedidos ON produtos_pedidos.pedido_id = pedidos.id
  INNER JOIN produtos ON produtos_pedidos.pedido_id = produtos.id;
 
-- 2)
SELECT
 pedidos.id
FROM
  produtos_pedidos
  INNER JOIN pedidos ON produtos_pedidos.pedido_id = pedidos.id
  INNER JOIN produtos ON produtos_pedidos.pedido_id = produtos.id
  WHERE produtos_pedidos.produto_id = 6;
-- 3)
SELECT
 clientes.nome AS gostam_de_fritas
FROM
  produtos_pedidos
  INNER JOIN pedidos ON produtos_pedidos.pedido_id = pedidos.id
  INNER JOIN produtos ON produtos_pedidos.pedido_id = produtos.id
  INNER JOIN clientes ON clientes.id = pedidos.cliente_id
  WHERE produtos_pedidos.produto_id = 6;


-- 4)
 SELECT SUM (produtos.preco) AS total
FROM
  pedidos
  INNER JOIN produtos_pedidos ON produtos_pedidos.pedido_id = pedidos.id
  INNER JOIN produtos ON produtos_pedidos.produto_id = produtos.id
INNER JOIN clientes ON clientes.id = pedidos.cliente_id
  WHERE produtos_pedidos.pedido_id =5;
-- 5)
 SELECT produtos.nome, COUNT (*) AS count
FROM
  produtos_pedidos
  INNER JOIN produtos ON produtos_pedidos.produto_id = produtos.id
GROUP BY produtos.nome
ORDER BY produtos.nome
;


