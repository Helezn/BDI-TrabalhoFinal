CREATE TABLE clientes (
    cod_cliente INT PRIMARY KEY NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    numero VARCHAR(10),
   	rua VARCHAR(50),
	CPF VARCHAR(11) UNIQUE,
	CNPJ VARCHAR(14) UNIQUE,
  	telefone VARCHAR(15)
);
CREATE TABLE vendedores (
    cod_vendedor INT PRIMARY KEY NOT NULL,
	nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    comissao DECIMAL(10, 2),
	auxiliar bool
);
CREATE TABLE produtos (
    cod_produto INT PRIMARY KEY NOT NULL,
	desconto float,
	quantidade INT NOT NULL,
    nome_tipo VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    descricao TEXT
);
CREATE TABLE pedidos (
    cod_pedido INT PRIMARY KEY NOT NULL,
	valor_total DECIMAL(10, 2) NOT NULL,
	forma_pagamento VARCHAR(50) NOT NULL,
    data_pedido DATE,
    cod_cliente INT,
	cod_vendedor INT,
    FOREIGN KEY (cod_cliente) REFERENCES clientes(cod_cliente),
 	FOREIGN KEY (cod_vendedor) REFERENCES vendedores(cod_vendedor)
);
CREATE TABLE categorias (
    cod_categoria INT PRIMARY KEY NOT NULL,
    tipo_categoria VARCHAR(50),
	cod_produto INT,
    FOREIGN KEY (cod_produto) REFERENCES produtos(cod_produto)
);

CREATE TABLE caixas(
    cod_caixa INT PRIMARY KEY NOT NULL,
	forma_pagamento VARCHAR(50) NOT NULL,
	total_caixa DECIMAL(10, 2),
    entrega VARCHAR(50) NOT NULL,
    cod_cliente INT,
	cod_vendedor INT,
    cod_pedido INT,
	FOREIGN KEY (cod_cliente) REFERENCES clientes(cod_cliente),
 	FOREIGN KEY (cod_vendedor) REFERENCES vendedores(cod_vendedor),
	FOREIGN KEY (cod_pedido) REFERENCES pedidos(cod_pedido)
);

INSERT INTO clientes (cod_cliente, nome, email, numero, rua, cpf, telefone)
VALUES
(1, 'João Silva', 'joao.silva@gmail.com', '286', 'Luiz Ceron', '03786097102', '5554991846755'),
(2, 'Maria Oliveira', 'maria.oliveira@gmail.com', '52', 'Leopoldo Magalhas', '04275643298', '5551992345678'),
(3, 'Pedro Souza', 'pedro.souza@hotmail.com', '128', 'Matheus Franscico', '82567354392', '5552991740244'),
(4, 'Ana Pereira', 'ana.pereira@gmail.com', '1232', 'Alcides Rebechi', '21175463291', '5552984645432'),
(5, 'Carlos Lima', 'carlos.lima@hotmail.com', '98', 'Roberval Jeronimo', '23678390872', '5554984039321'),
(6, 'Fernanda Alves', 'fernanda.alves@hotmail.com', '904', 'Patolino Xavier', '73678690843', '5554992878765'),
(7, 'Rafael Castro', 'rafael.castro@gmail.com', '729', 'Pernalonga Coelho', '23467585795', '5551992837465'),
(8, 'Juliana Costa', 'juliana.costa@hotmail.com', '187', 'Guarani', '95847362789', '5551990382637'),
(9, 'Ricardo Nunes', 'ricardo.nunes@gmail.com', '105', 'Romero Britto', '19384732028', '5554998364536'),
(10, 'Patrícia Fernandes', 'patricia.fernandes@gmail.com', '345', 'Homer Simpson', '78364597802', '5551984657865'),
(11, 'Sérgio Barbosa', 'sergio.barbosa@hotmail.com', '99', 'Presidente Vargas', '37263453828', '5554981726326'),
(12, 'Luciana Martins', 'luciana.martins@gmail.com', '10', 'Avenida Brasil', '27364056840', '555499983654');

INSERT INTO vendedores (cod_vendedor, nome, email, comissao, auxiliar)
VALUES
(1, 'José Rodrigues', 'jose.rodrigues@gmail.com', 5.00, '0'),
(2, 'Carlos Ribeiro', 'carlos.ribeiro@hotmail.com', 7.50, '1'),
(3, 'Paula Gonçalves', 'paula.goncalves@gmail.com', 4.00, '0'),
(4, 'Roberta Almeida', 'roberta.almeida@gmail.com', 6.00, '1'),
(5, 'Marcelo Dias', 'marcelo.dias@gmail.com', 8.00, '0'),
(6, 'Cláudia Moura', 'claudia.moura@gmail.com', 3.50, '0'),
(7, 'Henrique Souza', 'henrique.souza@hotmail.com', 5.50, '0'),
(8, 'Rosa Mendes', 'rosa.mendes@hotmail.com', 6.50, '1'),
(9, 'Adriano Silva', 'adriano.silva@hotmail.com', 7.00, '0'),
(10, 'Carolina Santos', 'carolina.santos@gmail.com', 4.50, '1'),
(11, 'Lucio Castro', 'lucio.castro@gmail.com', 6.75, '1'),
(12, 'Gustavo Neves', 'gustavo.neves@gmail.com', 5.25, '0');

INSERT INTO produtos (cod_produto, desconto, quantidade, nome_tipo, preco, descricao)
VALUES
(1, 0, 100, 'Cimento', 40.00, 'Cimento'),
(2, 0, 200, 'Tijolo', 30.00, 'Tijolo'),
(3, 0, 150, 'Telha', 20.00, 'Telha'),
(4, 0, 120, 'Tinta', 40.00, 'Tinta'),
(5, 0, 300, 'Treliça', 50.00, 'Treliça'),
(6, 0, 10, 'Furadeira', 200.00, 'Furadeira'),
(7, 0, 90, 'Estaca de madeira', 5.00, 'Estaca de madeira'),
(8, 0, 110, 'Cano PVC', 15.00, 'Cano PVC'),
(9, 0, 130, 'Fio eletrico', 10.00, 'Fio eletrico'),
(10, 0, 160, 'Martelo', 10.00, 'Martelo'),
(11, 0, 70, 'Piso', 50.00, 'Piso'),
(12, 0, 80, 'Janela', 35.00, 'Janela');

INSERT INTO pedidos (cod_pedido, valor_total, forma_pagamento, data_pedido, cod_cliente, cod_vendedor)
VALUES
(1, 100.00, 'Cartão de Crédito', '2024-08-01', 1, 1),
(2, 150.00, 'Boleto', '2024-08-02', 2, 2),
(3, 200.00, 'Dinheiro', '2024-08-03', 3, 3),
(4, 250.00, 'Cartão de Débito', '2024-08-04', 4, 4),
(5, 300.00, 'Pix', '2024-08-05', 5, 5),
(6, 350.00, 'Cartão de Crédito', '2024-08-06', 6, 6),
(7, 400.00, 'Boleto', '2024-08-07', 7, 7),
(8, 450.00, 'Dinheiro', '2024-08-08', 8, 8),
(9, 500.00, 'Cartão de Débito', '2024-08-09', 9, 9),
(10, 550.00, 'Pix', '2024-08-10', 10, 10),
(11, 600.00, 'Cartão de Crédito', '2024-08-11', 11, 11),
(12, 650.00, 'Boleto', '2024-08-12', 12, 12);

INSERT INTO categorias (cod_categoria, tipo_categoria, cod_produto)
VALUES
(1, 'Ferramentas Manuais', 10),
(2, 'Acabamentos', 3),
(3, 'Metais', 5),
(4, 'Tijolos e Blocos', 2),
(5, 'Cimento e Argamassa', 1),
(6, 'Tubos e Conexões', 8),
(7, 'Elétrica e Iluminação', 9),
(8, 'Portas e Janelas', 12),
(9, 'Revestimentos e Pisos', 11),
(10, 'Madeiras e Compensados', 7),
(11, 'Ferramentas Elétricas', 11),
(12, 'Tintas e Vernizes', 4);

INSERT INTO caixas (cod_caixa, forma_pagamento, total_caixa, entrega, cod_cliente, cod_vendedor, cod_pedido)
VALUES
(1, 'Cartão de Crédito', 100.00, 'Sim', 1, 1, 1),
(2, 'Boleto', 150.00, 'Não', 2, 2, 2),
(3, 'Dinheiro', 200.00, 'Sim', 3, 3, 3),
(4, 'Cartão de Débito', 250.00, 'Não', 4, 4, 4),(5, 'Pix', 300.00, 'Sim', 5, 5, 5),
(6, 'Cartão de Crédito', 350.00, 'Não', 6, 6, 6),
(7, 'Boleto', 400.00, 'Sim', 7, 7, 7),
(8, 'Dinheiro', 450.00, 'Não', 8, 8, 8),
(9, 'Cartão de Débito', 500.00, 'Sim', 9, 9, 9),
(10, 'Pix', 550.00, 'Não', 10, 10, 10),
(11, 'Cartão de Crédito', 600.00, 'Sim', 11, 11, 11),
(12, 'Boleto', 650.00, 'Não', 12, 12, 12);

--Faz a média do valor total entre os caixas
SELECT AVG(total_caixa) AS media_total_caixas
FROM caixas;

--Soma o valor de todos os pedidos
SELECT SUM(valor_total) AS valor_total_pedidos
FROM pedidos;

--Seleciona o pedido com menor valor
SELECT MIN(valor_total) AS pedido_menor_valor
FROM pedidos;

--Retorna se os vendedores que possuem auxiliar
SELECT cod_vendedor, nome
FROM vendedores
WHERE auxiliar=true;

--Retorna se os vendedores que não possuem auxiliar
SELECT cod_vendedor, nome
FROM vendedores
WHERE auxiliar=false;

-- Mostra todos os pedidos na data selecionada
SELECT *
FROM pedidos
WHERE data_pedido BETWEEN '2024-08-01' AND '2024-08-02';

-- Mostra todos os pedidos fora da data selecionada
SELECT *
FROM pedidos
WHERE data_pedido NOT BETWEEN '2024-08-01' AND '2024-08-02';

-- Atualiza valor produto aplicando desconto
UPDATE produtos
SET desconto = desconto * 1.1
WHERE cod_produto = 101;

-- Deleta vendedor que foi demitido
DELETE FROM vendedores
WHERE cod_vendedor = 5;

-- Média de vendas por vendedor
SELECT v.nome AS vendedor, AVG(p.valor_total) AS media_vendas
FROM vendedores v
JOIN pedidos p ON v.cod_vendedor = p.cod_vendedor
GROUP BY v.nome;

--Valor total de vendas em um intervalo de datas
SELECT SUM(p.valor_total) AS total_vendas
FROM pedidos p
WHERE p.data_pedido BETWEEN '2024-08-01' AND '2024-08-31';

--Total de vendas por forma de pagamento e cliente
SELECT c.nome AS cliente, p.forma_pagamento, SUM(p.valor_total) AS total_vendas
FROM clientes c
JOIN pedidos p ON c.cod_cliente = p.cod_cliente
GROUP BY c.nome, p.forma_pagamento;