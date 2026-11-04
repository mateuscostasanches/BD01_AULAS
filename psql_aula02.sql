-- COMANDOS DML - DATA MANIPULATION LANGUAGE
-- INSERT, UPDATE, DELETE

-- SINTAX INSERT COMMAND
INSERT INTO tabela (col1, col2, ..., coln) VALUES (val1, val2, ..., valn);

-- EXAMPLE TABLE DEPARTAMENTO
INSERT INTO departamento (nome, numero) VALUES ('FINANCEIRO', 1);
INSERT INTO departamento (nome, numero) VALUES ('COMERCIAL', 2);
INSERT INTO departamento (nome, numero) VALUES ('JURIDICO', 3);

-- EXAMPLE TABLE FUNCIONARIO 
INSERT INTO funcionario (ident, nome, sobrenome, endereco, dtnasc, salario, sexo, supident, dnumero)
            VALUES(1, 'Murilo', 'Varges', 'R. Pedro Cavalo', 
                           '1990-05-06', 9923.58, 'M', NULL, 1);

INSERT INTO funcionario (ident, nome, sobrenome, endereco, dtnasc, salario, sexo, supident, dnumero)
            VALUES(2, 'Valtemir', 'Alencar', 'R. João Galo', 
                              '1970-05-06', 9923.58, 'M', 1, 2);

INSERT INTO funcionario (ident, nome, sobrenome, endereco, dtnasc, salario, sexo, supident, dnumero)
            VALUES(3, 'Francisco', 'Sergio', 'R. Joao Silva', 
                               '1960-05-06', 9923.58, 'M', 1, 3);

INSERT INTO funcionario (ident, nome, sobrenome, endereco, dtnasc, salario, sexo, supident, dnumero)
            VALUES(4, 'Karina', 'Mitiko', 'R. Joao Silva', '1960-05-06', 9923.58, 'M', NULL, 3);

-- SEE INSERT REGISTERS
SELECT * FROM tabela;

ALTER TABLE funcionario
ALTER supident SET DEFAULT 5;

ALTER TABLE funcionario
ALTER sexo TYPE VARCHAR(1);
-- "ERRO:  coluna "sexo" não pode ser convertida 
--            automaticamente para tipo integer"
 
ALTER TABLE funcionario
DROP dnumero;
-- "dropa a coluna e tudo relacionado a ela (FOREIGN KEYs)"

ALTER TABLE departamento
DROP numero RESTRICT; 
-- DEVERIA DAR ERRO POR CONTA DA FK
-- NÃO DEIXA DELETAR SE TIVER

ALTER TABLE departamento 
DROP numero CASCADE; 
-- DELETAE O OBJETO E TODOS OS SEUS RELACIONAMENTOS
