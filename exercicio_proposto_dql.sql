-- DQL - Data Query Language

-- EXERCICIO PROPOSTO - DQL
-- PARTE B - CONSULTA

-- 6. Liste todos os dados da tabela curso.
SELECT * 
FROM curso;
--  id_curso |                 nome                  | carga_horaria | modalidade
-- ----------+---------------------------------------+---------------+------------
--         1 | Engenharia de Computação              |          3600 | Presencial
--         2 | Análise e Desenvolvimento de Sistemas |          2400 | Presencial
--         3 | Redes de Computadores                 |          2000 | Presencial
--         4 | Gestão da Tecnologia da Informação    |          2000 | Presencial
-- (4 linhas)


-- 7. Exiba apenas o nome e a matrícula de todos os alunos.
SELECT nome,matricula 
FROM aluno;
--        nome       | matricula
-- ------------------+-----------
--  Ana Souza        | 2026001
--  Bruno Lima       | 2026002
--  Carla Mendes     | 2026003
--  Diego Santos     | 2026004
--  Elisa Rocha      | 2026005
--  Felipe Alves     | 2026006
--  Gabriela Costa   | 2026007
--  Henrique Martins | 2026008
--  Isabela Oliveira | 2026009
--  João Pereira     | 2026010
-- (10 linhas)


-- 8. Liste os alunos em ordem alfabética pelo nome.
SELECT * FROM aluno 
ORDER BY nome ASC;
--  id_aluno |       nome       | matricula | data_nascimento | id_curso | email
-- ----------+------------------+-----------+-----------------+----------+-------
--         1 | Ana Souza        | 2026001   | 2005-03-15      |        1 |
--         2 | Bruno Lima       | 2026002   | 2004-07-22      |        1 |
--         3 | Carla Mendes     | 2026003   | 2006-01-10      |        2 |
--         4 | Diego Santos     | 2026004   | 2003-11-05      |        2 |
--         5 | Elisa Rocha      | 2026005   | 2005-09-18      |        3 |
--         6 | Felipe Alves     | 2026006   | 2004-04-30      |        3 |
--         7 | Gabriela Costa   | 2026007   | 2006-06-12      |        1 |
--         8 | Henrique Martins | 2026008   |                 |        2 |
--         9 | Isabela Oliveira | 2026009   | 2005-12-01      |        1 |
--        10 | João Pereira     | 2026010   |                 |        3 |
-- (10 linhas)


-- 9. Liste as disciplinas em ordem decrescente de carga horária. Em caso de empate, ordene pelo nome em ordem crescente.
SELECT * FROM disciplina 
ORDER BY carga_horaria DESC, nome ASC; 
--  id_disciplina |            nome             | carga_horaria | id_curso | ementa
-- ---------------+-----------------------------+---------------+----------+--------
--              1 | Algoritmos                  |            80 |        1 |
--              2 | Banco de Dados I            |            80 |        1 |
--              4 | Programação Web             |            80 |        2 |
--              7 | Redes de Computadores I     |            80 |        3 |
--              3 | Arquitetura de Computadores |            60 |        1 |
--              6 | Banco de Dados              |            60 |        2 |
--              5 | Engenharia de Software      |            60 |        2 |
--              8 | Segurança de Redes          |            60 |        3 |
--              9 | Sistemas Operacionais       |            60 |        3 |
-- (9 linhas)


-- 10. Liste os alunos vinculados ao curso de código 1.
SELECT * FROM aluno 
WHERE id_curso=1;
--  id_aluno |       nome       | matricula | data_nascimento | id_curso | email
-- ----------+------------------+-----------+-----------------+----------+-------
--         1 | Ana Souza        | 2026001   | 2005-03-15      |        1 |
--         2 | Bruno Lima       | 2026002   | 2004-07-22      |        1 |
--         7 | Gabriela Costa   | 2026007   | 2006-06-12      |        1 |
--         9 | Isabela Oliveira | 2026009   | 2005-12-01      |        1 |
-- (4 linhas)


-- 11. Liste as disciplinas com carga horária maior ou igual a 80.
SELECT * FROM disciplina
 WHERE carga_horaria >= 80;
--  id_disciplina |          nome           | carga_horaria | id_curso | ementa
-- ---------------+-------------------------+---------------+----------+--------
--              1 | Algoritmos              |            80 |        1 |
--              2 | Banco de Dados I        |            80 |        1 |
--              4 | Programação Web         |            80 |        2 |
--              7 | Redes de Computadores I |            80 |        3 |
-- (4 linhas)


-- 12. Liste os alunos com data de nascimento anterior a 2005-01-01.
SELECT * FROM aluno 
WHERE data_nascimento < '2005-01-01';
--  id_aluno |     nome     | matricula | data_nascimento | id_curso | email
-- ----------+--------------+-----------+-----------------+----------+-------
--         2 | Bruno Lima   | 2026002   | 2004-07-22      |        1 |
--         4 | Diego Santos | 2026004   | 2003-11-05      |        2 |
--         6 | Felipe Alves | 2026006   | 2004-04-30      |        3 |
-- (3 linhas)

-- 13. Liste os alunos cujo nome começa com a letra A, utilizando LIKE.
SELECT * FROM aluno 
WHERE nome LIKE 'A%';
--  id_aluno |   nome    | matricula | data_nascimento | id_curso | email
-- ----------+-----------+-----------+-----------------+----------+-------
--         1 | Ana Souza | 2026001   | 2005-03-15      |        1 |
-- (1 linha)


-- 14. Liste os alunos sem data de nascimento cadastrada.
SELECT * FROM aluno 
WHERE data_nascimento IS NULL;
--  id_aluno |       nome       | matricula | data_nascimento | id_curso | email
-- ----------+------------------+-----------+-----------------+----------+-------
--         8 | Henrique Martins | 2026008   |                 |        2 |
--        10 | João Pereira     | 2026010   |                 |        3 |
-- (2 linhas)


-- 15. Liste os alunos dos cursos 1 e 3, utilizando IN.
SELECT * FROM aluno 
WHERE id_curso IN (1, 3);
--  id_aluno |       nome       | matricula | data_nascimento | id_curso | email
-- ----------+------------------+-----------+-----------------+----------+-------
--         1 | Ana Souza        | 2026001   | 2005-03-15      |        1 |
--         2 | Bruno Lima       | 2026002   | 2004-07-22      |        1 |
--         5 | Elisa Rocha      | 2026005   | 2005-09-18      |        3 |
--         6 | Felipe Alves     | 2026006   | 2004-04-30      |        3 |
--         7 | Gabriela Costa   | 2026007   | 2006-06-12      |        1 |
--         9 | Isabela Oliveira | 2026009   | 2005-12-01      |        1 |
--        10 | João Pereira     | 2026010   |                 |        3 |
-- (7 linhas)


-- 16. Liste as disciplinas com carga horária entre 60 e 80, inclusive, utilizando BETWEEN.
SELECT * FROM disciplina 
WHERE carga_horaria BETWEEN 60 AND 80;
--  id_disciplina |            nome             | carga_horaria | id_curso | ementa
-- ---------------+-----------------------------+---------------+----------+--------
--              1 | Algoritmos                  |            80 |        1 |
--              2 | Banco de Dados I            |            80 |        1 |
--              3 | Arquitetura de Computadores |            60 |        1 |
--              4 | Programação Web             |            80 |        2 |
--              5 | Engenharia de Software      |            60 |        2 |
--              6 | Banco de Dados              |            60 |        2 |
--              7 | Redes de Computadores I     |            80 |        3 |
--              8 | Segurança de Redes          |            60 |        3 |
--              9 | Sistemas Operacionais       |            60 |        3 |
-- (9 linhas)


-- 17. Exiba o nome de cada aluno e o nome do seu curso.
SELECT a.nome AS nome_aluno, c.nome AS nome_curso 
FROM aluno a JOIN curso c ON a.id_curso = c.id_curso;
--     nome_aluno    |              nome_curso
-- ------------------+---------------------------------------
--  Isabela Oliveira | Engenharia de Computação
--  Gabriela Costa   | Engenharia de Computação
--  Bruno Lima       | Engenharia de Computação
--  Ana Souza        | Engenharia de Computação
--  Henrique Martins | Análise e Desenvolvimento de Sistemas
--  Diego Santos     | Análise e Desenvolvimento de Sistemas
--  Carla Mendes     | Análise e Desenvolvimento de Sistemas
--  João Pereira     | Redes de Computadores
--  Felipe Alves     | Redes de Computadores
--  Elisa Rocha      | Redes de Computadores
-- (10 linhas)


-- 18. Exiba o nome de cada disciplina, sua carga horária e o nome do curso ao qual pertence.
SELECT d.nome AS nome_disciplina, d.carga_horaria AS carga_horaria_disciplina, c.nome AS nome_curso 
FROM disciplina d JOIN curso c ON d.id_curso = c.id_curso;
--        nome_disciplina       | carga_horaria_disciplina |              nome_curso
-- -----------------------------+--------------------------+---------------------------------------
--  Arquitetura de Computadores |                       60 | Engenharia de Computação
--  Banco de Dados I            |                       80 | Engenharia de Computação
--  Algoritmos                  |                       80 | Engenharia de Computação
--  Banco de Dados              |                       60 | Análise e Desenvolvimento de Sistemas
--  Engenharia de Software      |                       60 | Análise e Desenvolvimento de Sistemas
--  Programação Web             |                       80 | Análise e Desenvolvimento de Sistemas
--  Sistemas Operacionais       |                       60 | Redes de Computadores
--  Segurança de Redes          |                       60 | Redes de Computadores
--  Redes de Computadores I     |                       80 | Redes de Computadores
-- (9 linhas)

-- 19. Liste o nome e a matrícula dos alunos do curso “Engenharia de Computação”. Faça o filtro pelo nome do curso, utilizando o relacionamento entre as tabelas
SELECT a.nome AS nome_aluno, a.matricula AS matricula_aluno 
FROM aluno a JOIN curso c ON a.id_curso = c.id_curso 
AND c.nome='Engenharia de Computação';
--     nome_aluno    | matricula_aluno
-- ------------------+-----------------
--  Ana Souza        | 2026001
--  Bruno Lima       | 2026002
--  Gabriela Costa   | 2026007
--  Isabela Oliveira | 2026009
-- (4 linhas)


-- 20. Exiba a quantidade total de alunos cadastrados.
SELECT COUNT(*) 
FROM aluno;
--  count
-- -------
--     10
-- (1 linha)


-- 21. Exiba a maior e a menor carga horária entre as disciplinas.
SELECT MIN(carga_horaria) AS menor_carga_horaria, MAX(carga_horaria) AS maior_carga_horaria 
FROM disciplina;
--  menor_carga_horaria | maior_carga_horaria
-- ---------------------+---------------------
--                   60 |                  80
-- (1 linha)


-- 22. Exiba a média das cargas horárias das disciplinas.
SELECT AVG(carga_horaria) 
FROM disciplina;
--          avg
-- ---------------------
--  68.8888888888888889
-- (1 linha)


-- 23. Exiba o nome de cada curso e sua quantidade de alunos. Inclua também os cursos sem alunos, apresentando quantidade igual a zero.
SELECT c.nome AS nome_curso, COUNT(a.id_aluno) AS quantidade_alunos 
FROM curso c LEFT JOIN aluno a ON c.id_curso = a.id_curso 
GROUP BY c.id_curso, c.nome;
--               nome_curso               | quantidade_alunos
-- ---------------------------------------+-------------------
--  Gestão da Tecnologia da Informação    |                 0
--  Análise e Desenvolvimento de Sistemas |                 3
--  Engenharia de Computação              |                 4
--  Redes de Computadores                 |                 3
-- (4 linhas)


-- 24. Exiba o nome de cada curso e a soma das cargas horárias de suas disciplinas. Inclua os cursos sem disciplinas, apresentando soma igual a zero.
SELECT c.nome AS nome_curso, SUM(d.carga_horaria) AS soma_cargas_horarias_disciplinas 
FROM curso c LEFT JOIN disciplina d ON c.id_curso = d.id_curso 
GROUP BY c.id_curso, c.nome;
--               nome_curso               | soma_cargas_horarias_disciplinas
-- ---------------------------------------+----------------------------------
--  Gestão da Tecnologia da Informação    |
--  Análise e Desenvolvimento de Sistemas |                              200
--  Engenharia de Computação              |                              220
--  Redes de Computadores                 |                              200
-- (4 linhas)


-- 25. Liste apenas os cursos com pelo menos três alunos, exibindo o nome do curso e a quantidade de alunos
SELECT c.nome AS nome_curso, COUNT(a.id_aluno) AS quantidade_alunos 
FROM curso c JOIN aluno a ON c.id_curso = a.id_curso 
GROUP BY c.id_curso, c.nome 
HAVING COUNT(a.id_aluno) >= 3;
--               nome_curso               | quantidade_alunos
-- ---------------------------------------+-------------------
--  Redes de Computadores                 |                 3
--  Análise e Desenvolvimento de Sistemas |                 3
--  Engenharia de Computação              |                 4
-- (3 linhas)