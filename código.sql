
CREATE TABLE IF NOT EXISTS Alunos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    data_nasc DATE,
    email TEXT,
    curso_id INTEGER,
    FOREIGN KEY (curso_id) REFERENCES Cursos(id)
);

CREATE TABLE IF NOT EXISTS Professores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    especialidade TEXT
);

CREATE TABLE IF NOT EXISTS Cursos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    professor_id INTEGER,
    FOREIGN KEY (professor_id) REFERENCES Professores(id)
);

CREATE PROCEDURE IF NOT EXISTS InsertCurso(
    p_nome TEXT,
    p_professor_id INTEGER
)
AS
BEGIN
    INSERT INTO Cursos (nome, professor_id) VALUES (p_nome, p_professor_id);
END;

CREATE PROCEDURE IF NOT EXISTS SelectCursos()
AS
BEGIN
    SELECT * FROM Cursos;
END;

CREATE PROCEDURE IF NOT EXISTS InsertAluno(
    p_nome TEXT,
    p_data_nasc DATE,
    p_curso_id INTEGER
)
AS
BEGIN
    DECLARE p_email TEXT;
    DECLARE p_count INTEGER;
    
    SELECT COUNT(*) INTO p_count FROM Alunos WHERE nome = p_nome;
    
    IF p_count > 0 THEN
        SET p_email = p_nome || p_count || '@dominio.com';
    ELSE
        SET p_email = p_nome || '@dominio.com';
    END IF;
    
    INSERT INTO Alunos (nome, data_nasc, email, curso_id) VALUES (p_nome, p_data_nasc, p_email, p_curso_id);
END;

CALL InsertCurso('Matemática', 1);
CALL InsertCurso('Física', 2);
CALL InsertCurso('História', 3);

CALL InsertAluno('João Silva', '2000-01-01', 1);
CALL InsertAluno('Maria Silva', '2001-02-03', 1);
CALL InsertAluno('João Silva', '1999-03-04', 2);

CALL SelectCursos;
