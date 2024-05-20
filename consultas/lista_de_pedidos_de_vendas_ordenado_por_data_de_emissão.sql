-- lista de pedidos de vendas ordenado por data de emiss~ao atraves da tabela cliente e pedido
SELECT 
    cliente.razao_social AS cliente,
    SUM(pedido.valor_total) AS faturamento_total
FROM 
    pedido
INNER JOIN 
    cliente ON pedido.id_cliente = cliente.id_cliente
GROUP BY 
    cliente.razao_social
ORDER BY 
    MIN(pedido.data_emissao);
