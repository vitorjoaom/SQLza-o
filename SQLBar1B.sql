CREATE DATABASE BAR
USE BAR

CREATE TABLE cliente (
idCliente INT IDENTITY(1,1) PRIMARY KEY,
nome VARCHAR(50)
)

CREATE TABLE pedido(
idPedido INT IDENTITY(1,1) PRIMARY KEY,
numeroDoPedido INT NOT NULL,
idCliente INT FOREIGN KEY(idCliente) REFERENCES cliente(idCliente)
)

CREATE TABLE itensPedido(
	idItem INT IDENTITY(1,1) PRIMARY KEY,
	nomeProduto VARCHAR(30) NOT NULL,
	quantidade INT NOT NULL,
	idPedido INT FOREIGN KEY(idPedido) REFERENCES pedido(idPedido)
)

INSERT INTO cliente(nome) VALUES ('Joaquim')
INSERT INTO cliente(nome) VALUES ('João')
INSERT INTO cliente(nome) VALUES ('Mateus')
SELECT * FROM cliente

INSERT INTO pedido(numeroDoPedido, idCliente) VALUES (1,3)
INSERT INTO pedido(numeroDoPedido, idCliente)  VALUES (2,1)
INSERT INTO pedido(numeroDoPedido, idCliente)  VALUES (3,2)
SELECT * FROM pedido

INSERT INTO itensPedido(nomeProduto, quantidade,idPedido) VALUES ('Fanta Uva LATA', 2, 1)
INSERT INTO itensPedido(nomeProduto, quantidade,idPedido) VALUES ('Batata Frita', 1, 1)
INSERT INTO itensPedido(nomeProduto, quantidade,idPedido) VALUES ('Sanduíches', 3, 2)
INSERT INTO itensPedido(nomeProduto, quantidade,idPedido) VALUES ('Coca-Cola LATA', 3, 2)
INSERT INTO itensPedido(nomeProduto, quantidade,idPedido) VALUES ('Pasteis de queijo', 5, 3)
INSERT INTO itensPedido(nomeProduto, quantidade,idPedido) VALUES ('Guaraná 2L', 1, 3)
SELECT * FROM itensPedido

SELECT cliente.nome, pedido.numeroDoPedido
	FROM cliente INNER JOIN pedido
		ON	cliente.idCliente = pedido.idCliente

		SELECT cliente.nome, itenspedido.nomeProduto
			FROM cliente
				LEFT JOIN pedido ON cliente.idCliente = pedido.idCliente
				LEFT JOIN itensPedido ON pedido.idPedido = itensPedido.idPedido

SELECT cliente.nome, itensPedido.nomeProduto
FROM cliente
RIGHT JOIN pedido ON cliente.idCliente = pedido.idCLiente
RIGHT JOIN itensPedido ON pedido.idPedido = itensPedido
--GUARANÁ 2L NOME DE QUEM COMPROU?
SELECT cliente.nome
	FROM cliente
	RIGHT JOIN pedido ON cliente.idCliente = pedido.idCliente
	RIGHT JOIN itensPedido ON pedido.idPedido = itensPedido.idPedido
	WHERE itensPedido.idItem = 6
--QUEM COMPROU BATATA FRITA?
SELECT ItensPedido.idPedido 
	   FROM itensPedido
		WHERE itensPedido.idItem='2'

SELECT cliente.nome, itensPedido.nomeProduto
	FROM cliente
	RIGHT JOIN nomeProduto ON itensPedido = pedido.idCliente
	RIGHT JOIN pedido ON idPedido = itensPedido.idPedido
	WHERE idPedido = '6'
	
	SELECT * FROM itenspedido
	SELECT * FROM pedido
	SELECT * FROM cliente