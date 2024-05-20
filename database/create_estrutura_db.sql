--Caso esteja usando o VSCODE, recomendo instalar as extensões SQLITE e SQLITE Viewer
--Criação das tabelas e inserção de dados fictícios para conseguir realizar os desafios do desafio

/*CRIAÇÃO DA TABELA EMPRESA*/
create table empresa(
    id_empresa INTEGER PRIMARY KEY,
    razao_social VARCHAR(255) NOT NULL,
    inativo BOOLEAN DEFAULT FALSE
)
/* Inserindo dados fictícios na tabela empresa */
INSERT INTO empresa (id_empresa, razao_social, inativo) VALUES
(1, 'Coca-Cola', FALSE),
(2, 'Pepsi', FALSE),
(3, 'Fanta', FALSE),
(4, 'Sprite', True),
(5, 'Guarana', True),
(6, 'Kuat', True)

/*CRIAÇÃO DA TABELA PRODUTOS*/
create table produtos(
    id_produto INTEGER PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    inativo BOOLEAN DEFAULT FALSE
)

/* Inserindo dados fictícios na tabela produtos */
INSERT INTO produtos (id_produto, descricao, inativo) VALUES
(1, 'Produto Coca-Cola', FALSE),
(2, 'Produto Pepsi', FALSE),
(3, 'Produto Fanta', TRUE);

/*CRIAÇÃO DA TABELA CONFIG_PRECO_PRODUTOS*/
create table config_preco_produto(
    id_config_preco_produto INTEGER PRIMARY KEY,
    id_vendedor INT,
    id_empresa INT,
    id_produto INT,
    preco_minimo DECIMAL(10, 2),
    preco_maximo DECIMAL(10, 2),
    FOREIGN KEY (id_vendedor) REFERENCES VENDEDORES(id_vendedor),
    FOREIGN KEY (id_empresa) REFERENCES EMPRESA(id_empresa)
)

/* Inserindo dados fictícios na tabela config_preco_produto*/
INSERT INTO config_preco_produto (id_config_preco_produto, id_vendedor, id_empresa, id_produto, preco_minimo, preco_maximo) VALUES
(1, 1, 1, 1, 400.00, 600.00),
(2, 1, 1, 2, 500.00, 700.00),
(3, 2, 2, 3, 700.00, 900.00),
(4, 3, 1, 1, 450.00, 650.00);


/*CRIAÇÃO DA TABELA VENDEDORES*/
CREATE TABLE vendedores (
    id_vendedor INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(100),
    salario DECIMAL(10, 2),
    data_admissao DATE,
    inativo BOOLEAN DEFAULT FALSE
);

/*inserindo dados fictícios na tabela vendedores*/
INSERT INTO vendedores (id_vendedor, nome, cargo, salario, data_admissao, inativo) VALUES
(1, 'Joao', 'Vendedor', 1500.00, '2020-03-15', FALSE),
(2, 'Maria', 'Gerente', 2300.00, '2021-06-20', FALSE),
(3, 'Roger', 'Repositor', 2000.00, '2019-12-10', TRUE)

/*CRIAÇÃO DA TABELA CLIENTES*/
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY,
    razao_social VARCHAR(255) NOT NULL,
    data_cadastro DATE,
    id_vendedor INT,
    id_empresa INT,
    inativo BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_vendedor) REFERENCES VENDEDORES(id_vendedor),
    FOREIGN KEY (id_empresa) REFERENCES EMPRESA(id_empresa)
);

/*inserindo dados fictícios na tabela clientes*/
INSERT INTO cliente (id_cliente, razao_social, data_cadastro, id_vendedor, id_empresa, inativo) VALUES
(1, 'Cliente Helena', '2022-01-10', 1, 1, FALSE),
(2, 'Cliente Flavio', '2023-05-20', 2, 2, FALSE),
(3, 'Cliente Tulio', '2023-09-15', 3, 1, TRUE);

/*CRIAÇÃO DA TABELA PEDIDOS*/
CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY,
    id_empresa INT,
    id_cliente INT,
    valor_total DECIMAL(10, 2),
    data_emissao DATE,
    situacao VARCHAR(50),
    FOREIGN KEY (id_empresa) REFERENCES EMPRESA(id_empresa),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_cliente)
);

/*inserindo dados fictícios na tabela pedidos*/
INSERT INTO pedido (id_pedido, id_empresa, id_cliente, valor_total, data_emissao, situacao) VALUES
(1, 1, 1, 1500.00, '2024-05-15', 'Concluído'),
(2, 2, 2, 2000.00, '2024-05-16', 'Concluído'),
(3, 1, 3, 1800.00, '2024-05-17', 'Pendente');

/*CRIAÇÃO DA TABELA ITENS_PEDIDOS*/
CREATE TABLE itens_pedido (
    id_item_pedido INT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    preco_praticado DECIMAL(10, 2),
    quantidade INT,
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido)
    FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto)
);

/*inserindo dados fictícios na tabela itens_pedidos*/
INSERT INTO itens_pedido (id_item_pedido, id_pedido, id_produto, preco_praticado, quantidade) VALUES
(1, 1, 1, 500.00, 2),
(2, 1, 2, 600.00, 1),
(3, 2, 3, 800.00, 2),
(4, 3, 1, 700.00, 3);