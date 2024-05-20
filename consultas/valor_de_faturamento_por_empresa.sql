--valor de faturamento por empresas

-- seleciona aa coluna razão social da empresa e calcula o faturamento total de cada uma
SELECT 
    empresa.razao_social, 
    SUM(pedido.valor_total) AS faturamento_total
FROM 
    pedido
JOIN 
    empresa ON pedido.id_empresa = empresa.id_empresa
GROUP BY 
    empresa.razao_social;
