----- Tabela alunos
CREATE TABLE aluno (
    matricula SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    serie VARCHAR(20) NOT NULL
);

----- Tabela livros
CREATE TABLE Livro (
    codigo SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    ano_publicacao INT NOT NULL
);

----- Tabela emprestimo
CREATE TABLE Emprestimo (
    id SERIAL PRIMARY KEY,
    data_retirada DATE NOT NULL,
    data_devolucao DATE,
    id_aluno INT NOT NULL REFERENCES aluno(matricula),
    id_livro INT NOT NULL REFERENCES livro(codigo)
);

----- Criação de um indice de restrição
CREATE UNIQUE INDEX idx_unico_emprestimo_ativo
ON emprestimo (id_livro)
WHERE data_devolucao IS NULL;

----- Inserindo alunos
INSERT INTO aluno (nome, serie) VALUES
('Andressa','5Ano'),
('Maria','7Ano'),
('João','9Ano'),
('Jorge','6Ano'),
('Regina','8Ano');

----- Inserindo os livros
INSERT INTO livro (titulo, autor, ano_publicacao) VALUES
('Dom Casmurro', 'Machado de Assis', 1899),
('O Cortiço','Aluísio Azevedo', 1890),
('Memórias Póstumas de Brás Cubas','Machado de Assis', 1881);

----- Inserindo um emprestimo de um livro
INSERT INTO emprestimo (data_retirada, id_aluno, id_livro) VALUES
('2024-08-22', 1, 2); 

----- Visualizando a tabela emprestimo
SELECT * FROM emprestimo

----- Atualizando a data de devolução do livro
UPDATE emprestimo SET data_devolucao = '2024-08-22' WHERE id = 1;
