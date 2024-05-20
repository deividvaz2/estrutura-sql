/*Lista de funcionários ordenando pelo salário decrescente usando a tabela vendedores.*/
SELECT 
    id_vendedor,
    nome,
    cargo,
    salario,
    data_admissao,
    inativo
FROM 
    vendedores
ORDER BY 
    salario DESC;