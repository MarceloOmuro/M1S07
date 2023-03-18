CREATE DATABASE LOJA

CREATE TABLE CLIENTE(
    ID INT PRIMARY KEY,
    NOME VARCHAR(20) NOT NULL,
    CPF VARCHAR(11) UNIQUE NOT NULL,
);

CREATE TABLE TELEFONE(
	ID_CLIENTE INT REFERENCES CLIENTE(ID),
	TELEFONE VARCHAR (11),
	)

CREATE TABLE ENDEREÇO(
	ID_CLIENTE INT REFERENCES CLIENTE(ID),
	ENDEREÇO VARCHAR (MAX),
	)

CREATE TABLE ITENS(
    ID INT PRIMARY KEY,
    PRODUTO VARCHAR(20) NOT NULL,
    DESCRICAO VARCHAR(100),
    VALOR DECIMAL
);

CREATE TABLE VENDA(
    ID INT PRIMARY KEY,
    DATA_VENDA DATETIME,
    ID_CLIENTE INT REFERENCES CLIENTE(ID)
);

CREATE TABLE VENDA_X_ITEM(
    ID_VENDA INT REFERENCES VENDA(ID),
    ID_ITEM INT REFERENCES ITENS(ID),
    QUANTIDADE INT,
);

INSERT INTO CLIENTE (ID, NOME, CPF) VALUES (1,'João', '999999999'),
                                            (2,'Maria', '88888888')

INSERT INTO TELEFONE (ID_CLIENTE, TELEFONE) VALUES (1, '7777777'),
                                                    (1, '5555555'),
                                                    (2, '4444444'),
                                                    (2, '2222222')

INSERT INTO ENDEREÇO (ID_CLIENTE, ENDEREÇO) VALUES (1, 'Rua Margarida'),
                                                    (1, 'Rua da Praia'),
                                                    (2, 'Rua das Rosas'),
                                                    (2, 'Rua dos Estudantes')

INSERT INTO ITENS (ID, PRODUTO, DESCRICAO, VALOR) VALUES (1, 'Calça', 'Jeans', 99.99),
                                                         (2, 'Camiseta', 'Polo', 49.99),
														 (3, 'Cueca', 'Sarja', 29.99),
														 (4, 'Agasalho', 'Moleton', 109.99),
														 (5, 'Boné', 'Couro', 39.99)

INSERT INTO VENDA(ID, DATA_VENDA, ID_CLIENTE) VALUES (10, 2023-03-10, 1),
                                                     (20, 2023-03-06, 2),
                                                     (30, 2023-03-02, 1)

INSERT INTO VENDA_X_ITEM (ID_VENDA, ID_ITEM, QUANTIDADE) VALUES (10, 2, 1),
                                                                (10, 2, 1),
																(30, 2, 1),
																(10, 2, 1),
																(20, 2, 1),
																(10, 2, 1)


SELECT * FROM CLIENTE
SELECT * FROM TELEFONE
SELECT * FROM ENDEREÇO
SELECT * FROM ITENS
SELECT * FROM VENDA
SELECT * FROM VENDA_X_ITEM

SELECT * FROM VENDA
INNER JOIN CLIENTE ON CLIENTE.ID=VENDA.ID_CLIENTE


SELECT*FROM VENDA
JOIN CLIENTE ON CLIENTE.NOME=CLIENTE.NOME

SELECT*FROM VENDA
JOIN CLIENTE ON CLIENTE.ID=VENDA.ID_CLIENTE



SELECT * FROM VENDA
JOIN VENDA_X_ITEM ON VENDA_X_ITEM.ID_VENDA = ID

JOIN CLIENTE ON VENDA.ID_CLIENTE = CLIENTE.ID
WHERE VENDA.ID=10