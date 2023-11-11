CREATE  DATABASE ATIVIDADE1
USE ATIVIDADE1

CREATE TABLE pessoa(
id INT PRIMARY KEY IDENTITY (1,1),
nome VARCHAR(50) NOT NULL
)

CREATE TABLE telefone(
Operadora VARCHAR(5) NOT NULL,
numero CHAR(11) NOT NULL,
idPessoa INT FOREIGN KEY(idPessoa) REFERENCES pessoa(id)
)

CREATE TABLE endereco(
estado VARCHAR(30) NOT NULL,
cidade VARCHAR(30) NOT NULL,
bairro VARCHAR(30) NOT NULL,
rua VARCHAR(50) NOT NULL,
numero VARCHAR (5) NOT NULL,
cep CHAR(8) NOT NULL,
idPessoa INT FOREIGN KEY(idPessoa) REFERENCES pessoa(id)
)

INSERT INTO pessoa (nome) values
('Ana Maria'), ('Tobias Medeiros'), ('Margarete Santos'), ('Pedro Silva'), ('Fabio Morais')

select * from telefone
-- FAVOR NÃO PASSAR TROTE, NÃO SEI DE QUEM É.
INSERT INTO telefone (Operadora, numero, idPessoa) values
('Claro', '84994252658',1),
('Tim', '84998985424',1),
('Vivo', '84981156987',1),
('Vivo', '84981752648',2),
('Claro', '84994225569',3),
('Tim', '84999524578',3),
('Tim', '84998865432',4),
('Vivo', '84981953265',4),
('Claro', '84992957856',5),
('Oi', '84987275468',5)

--- TODOS OS ENDEREÇOS FORAM FRUTOS DAS VOZES DA MINHA CABEÇA, NADA VERIDICO.
INSERT INTO endereco (estado, cidade, bairro, rua, numero, cep, idPessoa) values
('Bahia', 'Vitoria da Conquista', 'Centro', 'Av. Edgar Santos', '95','45658609', 1),
('Pernambuco', 'Recife', 'Bongi', 'Tv. Santo Angelo', '517','51047952', 2),
('Pernambuco', 'Recife', 'Bongi', 'Av. Governador Magalhaes', '2569','51500270', 2),
('Rio Grande do Norte', 'Parnamirim', 'Nova Parnamirim', 'Av. Maria Lacerda', '912','59054320', 3),
('Rio Grande do Norte', 'Natal', 'Tirol', 'Av. Prudente de Morais', '1420','59063545', 3),
('Bahia', 'Salvador', 'Cidade Baixa', 'Av. Tancredo Neves', '95','45864540', 4),
('Pernambuco', 'Casa Forte', 'Centro', 'Av. Governador Magalhaes', '2569','51500270', 5),
('Rio Grande do Norte', 'Parnamirim', 'Nova Parnamirim', 'Av. Maria Lacerda', '873','59054320', 5),
('Rio Grande do Norte', 'Natal', 'Alecrim', 'Av. Coronel Estevam', '1220','59020650', 5)

--- POR ALGUMA RAZÃO ESTÁ TRAZENDO TODAS AS INFORMAÇÕES SEM WHERE
SELECT p.nome, t.numero, e.estado, e.cidade, e.bairro, e.rua, e.numero, e.cep FROM pessoa p, telefone t, endereco e
	WHERE p.id =  t.idPessoa AND P.id = e.idPessoa

SELECT COUNT(*) AS contagemTelefonePorPessoa
	FROM TELEFONE
		WHERE idPessoa=1

SELECT COUNT(*) AS contagemTelefonePorPessoa
	FROM ENDERECO
		WHERE idPessoa=1

SELECT endereco.estado, telefone.Operadora
	FROM endereco, telefone, pessoa
		INNER JOIN pessoa ON pessoa.id = endereco.idPessoa