-- DML - Data Manipulation Language

-- INSERT INTO <NOME_TABELA> VALUES (valores de todas as colunas)
-- INSERT INTO <NOME_TABELA> (colunas especificas) VALUES (valores para as colunas especificadas)
--
-- UPDATE <NOME_TABELA> 
-- SET <campos_a_serem_alterados = novo_valor,...> : novos valores
-- WHERE <condição>                                : condição para indicar tuplas a serem modificadas
--
-- UPDATE FUNCIONARIO
-- SET salario = salario * 1,1
-- WHERE dnumero IN (SELECT... FROM... WHERE...)   : IN é uma consulta dentro de um update
--
-- DELETE FROM <NOME_TABELA>                       : deleta toda a tabela;
-- DELETE FROM <NOME_TABELA> WHERE <condição>      : deleta apenas tuplas satisfaçam condição imposta

-- EXERCICIO PROPOSTO - DML
-- PARTE A - INSERT

-- EXERCICIO 1 - CADASTRO CURSOS
INSERT INTO curso (id_curso, nome, carga_horaria) VALUES (1, 'Engenharia de Computação', 3600);
INSERT INTO curso (id_curso, nome, carga_horaria) VALUES (2, 'Análise e Desenvolvimento de Sistemas', 2400);
INSERT INTO curso (id_curso, nome, carga_horaria) VALUES (3, 'Redes de Computadores', 2000);
INSERT INTO curso (id_curso, nome, carga_horaria) VALUES (4, 'Gestão da Tecnologia da Informação', 2000);

-- EXERCICIO 2 - CADASTRO ALUNOS
INSERT INTO aluno (id_aluno, nome, matricula, data_nascimento, id_curso) VALUES ( 1, 'Ana Souza',        '2026001', '2005-03-15', 1);
INSERT INTO aluno (id_aluno, nome, matricula, data_nascimento, id_curso) VALUES ( 2, 'Bruno Lima',       '2026002', '2004-07-22', 1);
INSERT INTO aluno (id_aluno, nome, matricula, data_nascimento, id_curso) VALUES ( 3, 'Carla Mendes',     '2026003', '2006-01-10', 2);
INSERT INTO aluno (id_aluno, nome, matricula, data_nascimento, id_curso) VALUES ( 4, 'Diego Santos',     '2026004', '2003-11-05', 2);
INSERT INTO aluno (id_aluno, nome, matricula, data_nascimento, id_curso) VALUES ( 5, 'Elisa Rocha',      '2026005', '2005-09-18', 3);
INSERT INTO aluno (id_aluno, nome, matricula, data_nascimento, id_curso) VALUES ( 6, 'Felipe Alves',     '2026006', '2004-04-30', 3);
INSERT INTO aluno (id_aluno, nome, matricula, data_nascimento, id_curso) VALUES ( 7, 'Gabriela Costa',   '2026007', '2006-06-12', 1);
INSERT INTO aluno (id_aluno, nome, matricula, data_nascimento, id_curso) VALUES ( 8, 'Henrique Martins', '2026008', NULL,         2);
INSERT INTO aluno (id_aluno, nome, matricula, data_nascimento, id_curso) VALUES ( 9, 'Isabela Oliveira', '2026009', '2005-12-01', 1);
INSERT INTO aluno (id_aluno, nome, matricula, data_nascimento, id_curso) VALUES (10, 'João Pereira',     '2026010', NULL,         3);

-- EXERCICIO 3 - CADASTRO DISCIPLINAS
INSERT INTO disciplina VALUES (1, 'Algoritmos', 80, 1);
INSERT INTO disciplina VALUES (2, 'Banco de Dados I', 80, 1);
INSERT INTO disciplina VALUES (3, 'Arquitetura de Computadores', 60, 1);
INSERT INTO disciplina VALUES (4, 'Programação Web', 80, 2);
INSERT INTO disciplina VALUES (5, 'Engenharia de Software', 60, 2);
INSERT INTO disciplina VALUES (6, 'Banco de Dados', 60, 2);
INSERT INTO disciplina VALUES (7, 'Redes de Computadores I', 80, 3);
INSERT INTO disciplina VALUES (8, 'Segurança de Redes', 60, 3);
INSERT INTO disciplina VALUES (9, 'Sistemas Operacionais', 60, 3);

-- EXERCÍCIO 4 - TESTE MATRICULA DUPLICADA
INSERT INTO aluno VALUES (11, 'Lucas Ferreira', '2026001', '2005-08-20', 1);
-- ERRO:  duplicar valor da chave viola a restrição de unicidade "uq_aluno_matricula"
-- DETALHE:  Chave (matricula)=(2026001) já existe.
-- A inserção deu erro, pois viola a restrição de unicidade da matrícula (matricula VARCHAR(20) UNIQUE NOT NULL);

-- EXERCICIO 5 - TESTE CHAVE ESTRANGEIRA 
INSERT INTO disciplina VALUES (10, 'Inteligencia Artificial', 80, 99);
-- ERRO:  inserção ou atualização em tabela "disciplina" viola restrição de chave estrangeira "fk_disciplina_curso"
-- DETALHE:  Chave (id_curso)=(99) não está presente na tabela "curso".
-- A inserção deu erro, pois viola a restrição de chave estrangeira, pois não tem nenhum curso com código 99 no banco de dados