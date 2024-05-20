-- valor de faturmento por vendedor

-- seleciona o nome do vendedor e calcula o faturamento total gerado por cada um
SELECT 
    vendedores.nome AS nome_vendedor, 
    SUM(pedido.valor_total) AS valor_faturamento
FROM 
    pedido
JOIN 
    cliente ON pedido.id_cliente = cliente.id_cliente
JOIN 
    vendedores ON cliente.id_vendedor = vendedores.id_vendedor
GROUP BY 
    vendedores.nome;
