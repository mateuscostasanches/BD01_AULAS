DROP DATABASE IF EXISTS bi3032558_ifsp;
CREATE DATABASE bi3032558_ifsp;

-- REGRAS INTEGRIDADE
-- (FEITO) 1. Defina uma chave primária para cada tabela.
-- (FEITO) 2. Os nomes de cursos, alunos e disciplinas são obrigatórios.
-- (FEITO) 3. A matrícula do aluno é obrigatória e não pode se repetir.
-- (FEITO) 4. As cargas horárias de cursos e disciplinas são obrigatórias e devem ser maiores que zero.
-- (FEITO) 5. O vínculo com curso é obrigatório em ALUNO e DISCIPLINA.
-- (FEITO) 6. A data de nascimento é opcional.

-- PARTE A
-- (FEITO) 1. Crie a tabela CURSO com os campos do diagrama e as restrições indicadas.
-- (FEITO) 2. Crie a tabela ALUNO, incluindo a chave estrangeira para CURSO e a restrição UNIQUE da matrícula.
-- (FEITO) 3. Crie a tabela DISCIPLINA, incluindo a chave estrangeira para CURSO.
-- (FEITO) 4. Defina as restrições CHECK que garantem cargas horárias maiores que zero em CURSO e DISCIPLINA.
-- (FEITO) 5. Atribua nomes às restrições, por exemplo: pk_curso, fk_aluno_curso, uq_aluno_matricula e ck_disciplina_carga_horaria.


CREATE TABLE aluno
(
    id_aluno INTEGER, 
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    data_nascimento DATE,
    id_curso INTEGER NOT NULL,
    PRIMARY KEY (id_aluno)
);

CREATE TABLE disciplina
(
    id_disciplina INTEGER,
    nome VARCHAR(100) NOT NULL,
    ck_disciplina_carga_horaria INTEGER NOT NULL CHECK (ck_disciplina_carga_horaria > 0),
    id_curso INTEGER NOT NULL,
    PRIMARY KEY (id_disciplina)
);

ALTER TABLE aluno 
ADD CONSTRAINT fk_aluno_curso FOREIGN KEY (id_curso) REFERENCES curso (id_curso);

ALTER TABLE disciplina
ADD CONSTRAINT fk_disciplina_curso FOREIGN KEY (id_curso) REFERENCES curso (id_curso);

-- PARTE B
-- (FEITO) 6. Adicione o campo email VARCHAR(120), opcional, à tabela ALUNO.
-- (FEITO) 7. Adicione o campo telefone VARCHAR(20) à tabela ALUNO.
-- (FEITO) 8. Altere o tamanho do campo nome de ALUNO para VARCHAR(150).
-- (FEITO) 9. Adicione o campo modalidade VARCHAR(20) à tabela CURSO, com valor padrão 'Presencial'.
-- (FEITO) 10. Adicione uma restrição para aceitar em modalidade somente 'Presencial', 'EAD' ou 'Hibrido'.
-- (FEITO) 11. Adicione o campo ementa VARCHAR(500), opcional, à tabela DISCIPLINA.
-- (FEITO) 12. Renomeie o campo telefone de ALUNO para celular e, em seguida, remova esse campo.
-- (FEITO) 13. Remova a restrição UNIQUE da matrícula e depois a recrie.

ALTER TABLE aluno ADD email VARCHAR(120);
ALTER TABLE aluno ADD telefone VARCHAR(20);

ALTER TABLE aluno ALTER COLUMN nome TYPE VARCHAR(150);

ALTER TABLE curso ADD COLUMN modalidade VARCHAR(20) DEFAULT 'Presencial';
ALTER TABLE curso ADD CONSTRAINT ck_curso_modalidade CHECK (modalidade IN ('Presencial', 'EAD', 'Hibrido'));

ALTER TABLE disciplina ADD ementa VARCHAR(500);

ALTER TABLE aluno RENAME COLUMN telefone TO celular;
ALTER TABLE aluno DROP celular;

ALTER TABLE aluno DROP CONSTRAINT aluno_matricula_key;
ALTER TABLE aluno ADD CONSTRAINT uq_aluno_matricula UNIQUE (matricula);

-- PARTE C
-- (FEITO) 14. Tente excluir CURSO enquanto as chaves estrangeiras ainda existem. Registre a mensagem ou o comportamento observado no SGBD.
-- (FEITO) 15. Sem utilizar exclusão em cascata, exclua as três tabelas em uma ordem que respeite as dependências.
-- (FEITO) 16. Execute novamente seu script de criação para reconstruir o modelo inicial.

DROP TABLE curso;
-- mensagem de erro retornada:
-- ERRO:  não é possível remover tabela curso, porque outros objetos dependem dele
-- DETALHE:  restrição fk_aluno_curso em tabela aluno depende de tabela curso
-- restrição fk_disciplina_curso em tabela disciplina depende de tabela curso
-- DICA:  Use DROP ... CASCADE para remover os objetos dependentes também."

DROP TABLE disciplina;
DROP TABLE aluno;
DROP TABLE curso;