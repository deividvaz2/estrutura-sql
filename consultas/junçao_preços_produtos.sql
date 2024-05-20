-- seleciona os detalhes dos produtos, clientes, empresas, vendedores e preços
SELECT
    p.id_produto,                                    -- ID do produto
    p.descricao AS descricao_produto,                -- Descrição do produto
    c.id_cliente,                                    -- ID do cliente
    c.razao_social AS razao_social_cliente,          -- Razão social do cliente
    e.id_empresa,                                    -- ID da empresa
    e.razao_social AS razao_social_empresa,          -- Razão social da empresa
    v.id_vendedor,                                   -- ID do vendedor
    v.nome AS nome_vendedor,                         -- Nome do vendedor
    cpp.preco_minimo,                                -- Preço mínimo do produto
    cpp.preco_maximo,                                -- Preço máximo do produto

    -- faz o calculo d;o preço base usando o preço praticado mais recente ou o preço mínimo se não houver registros
    COALESCE(
        (
            SELECT ip.preco_praticado
            FROM itens_pedido ip
            JOIN pedido pe ON ip.id_pedido = pe.id_pedido
            WHERE ip.id_produto = p.id_produto
              AND pe.id_cliente = c.id_cliente
            ORDER BY pe.data_emissao DESC
            LIMIT 1
        ),
        cpp.preco_minimo
    ) AS preco_base

-- Tabelas envolvidas na consulta
FROM
    produtos p
JOIN
    config_preco_produto cpp ON p.id_produto = cpp.id_produto
JOIN
    cliente c ON cpp.id_empresa = c.id_empresa
JOIN
    empresa e ON c.id_empresa = e.id_empresa
JOIN
    vendedores v ON cpp.id_vendedor = v.id_vendedor

-- aqui filtra os registros inativos
WHERE
    p.inativo = FALSE
    AND c.inativo = FALSE
    AND e.inativo = FALSE
    AND v.inativo = FALSE;
