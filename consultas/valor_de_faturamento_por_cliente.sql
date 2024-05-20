-- Seleciona a razão social do cliente e o faturamento total para cada cliente
SELECT 
    cliente.razao_social AS cliente,  -- Seleciona a razão social do cliente e renomeia como 'cliente'
    SUM(pedido.valor_total) AS faturamento_total  -- Calcula a soma do valor total dos pedidos para cada cliente e renomeia como 'faturamento_total'
    
-- Define a fonte principal de dados como a tabela 'pedido'
FROM 
    pedido
    
-- Realiza uma junção interna entre as tabelas 'pedido' e 'cliente' usando o ID do cliente como chave de junção
INNER JOIN 
    cliente ON pedido.id_cliente = cliente.id_cliente
    
-- Agrupa os resultados pelo nome do cliente para calcular o faturamento total para cada cliente
GROUP BY 
    cliente.razao_social;
