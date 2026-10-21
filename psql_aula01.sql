-- COMANDOS DDL - DATA DEFINITION LANGUAGE

-- COMANDOS TERMINAL PSQL
-- \c <DATABASE> : entrar em determinado database
-- \d <TABELA>   : listar atributos de determinada tabela
-- \dt           : listar tabelas de determinado database
-- \dD           : listar dominios de determinado database

\c postgres;
DROP DATABASE IF EXISTS empresa;
CREATE DATABASE empresa;

\c empresa;
CREATE DOMAIN TIPO_ID CHAR(4);
CREATE DOMAIN D_NUM AS INTEGER CHECK (VALUE > 0 AND VALUE < 21);

-- ESQUEMA EMPRESA
-- FUNCIONARIO(ident, nome, sobrenome, endereco, dtnasc, salario,sexo,supident, dnumero)
-- DEPENDENTE(fident, nome, dt_nasc, sexo, relacionamento)
-- DEPARTAMENTO(numero, nome, gident, dtinicio)
-- LOCALIZACOES(dnumero, localizacao)
-- PROJETO(numero, nome, localizacao, dnumero)
-- TRABALHA_EM(pnumero, fident, horas)

CREATE TABLE funcionario
(
ident TIPO_ID,
nome VARCHAR(15) NOT NULL,
sobrenome VARCHAR(15) NOT NULL,
endereco VARCHAR(30),
dtnasc DATE,
salario DECIMAL(10,2),
sexo VARCHAR(1),
supident TIPO_ID,
dnumero TIPO_ID NOT NULL,
PRIMARY KEY (ident),
FOREIGN KEY (supident) REFERENCES FUNCIONARIO (ident),
FOREIGN KEY (dnumero) REFERENCES DEPARTAMENTO (numero)
);

CREATE TABLE dependente
(
fident TIPO_ID,
nome VARCHAR(15) NOT NULL,
dtnasc DATE,
sexo VARCHAR(1),
relacionamento VARCHAR(15),
PRIMARY KEY (fident, nome)
);

CREATE TABLE departamento
(
numero TIPO_ID,
nome VARCHAR(15) NOT NULL, 
gident TIPO_ID, 
dtinicio DATE,
PRIMARY KEY (numero)
);

CREATE TABLE localizacoes
(
dnumero TIPO_ID, 
localizacao VARCHAR(15) NOT NULL,
PRIMARY KEY (dnumero, localizacao)
);

CREATE TABLE projeto
(
numero TIPO_ID, 
nome VARCHAR(15) NOT NULL, 
localizacao VARCHAR(15) NOT NULL, 
dnumero TIPO_ID NOT NULL,
PRIMARY KEY (numero)
);

CREATE TABLE trabalha_em
(
pnumero TIPO_ID, 
fident TIPO_ID NOT NULL, 
horas INTEGER,
PRIMARY KEY (pnumero, fident)
);

-- \d FUNCIONARIO : listar atributos tabela FUNCIONARIO

ALTER TABLE FUNCIONARIO DROP sexo;
ALTER TABLE FUNCIONARIO ADD sexo VARCHAR(1);

-- Comandos DML - DATA MANIPULATION LANGUAGE
INSERT INTO DEPARTAMENTO VALUES(1, 'TI', NULL, NULL);
SELECT * FROM DEPARTAMENTO;
