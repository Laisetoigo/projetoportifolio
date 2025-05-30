-- Criação do banco de dados
CREATE DATABASE faculdade;
USE faculdade;

-- Tabela: tbl_curso
CREATE TABLE tbl_curso (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    carga_horaria TIME,
    curso VARCHAR(100) NOT NULL
);

-- Tabela: tbl_professor
CREATE TABLE tbl_professor (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    area_atuacao VARCHAR(45),
    email VARCHAR(150),
    telefone VARCHAR(20),
    nome_professor VARCHAR(45)
);

-- Tabela: tbl_disciplina
CREATE TABLE tbl_disciplina (
    id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    id_professor INT,
    id_curso INT,
    carga_horaria INT,
    disciplina VARCHAR(100),
    codigo_disciplina INT,
    FOREIGN KEY (id_professor) REFERENCES tbl_professor(id_professor),
    FOREIGN KEY (id_curso) REFERENCES tbl_curso(id_curso)
);

-- Tabela: tbl_turma
CREATE TABLE tbl_turma (
    id_turma INT PRIMARY KEY AUTO_INCREMENT,
    id_curso INT,
    semestre TEXT,
    turno TEXT,
    nome_turma TEXT,
    FOREIGN KEY (id_curso) REFERENCES tbl_curso(id_curso)
);

-- Tabela: tbl_aluno
CREATE TABLE tbl_aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome_aluno VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(100),
    cpf VARCHAR(14),
    data_nascimento DATE
);

-- Tabela: tbl_matricula
CREATE TABLE tbl_matricula (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_turma INT,
    id_aluno INT,
    data_matricula DATE,
    situacao VARCHAR(45),
    observacoes TEXT,
    FOREIGN KEY (id_turma) REFERENCES tbl_turma(id_turma),
    FOREIGN KEY (id_aluno) REFERENCES tbl_aluno(id_aluno)
);

-- Tabela: tbl_notas
CREATE TABLE tbl_notas (
    id_notas INT PRIMARY KEY AUTO_INCREMENT,
    id_matricula INT,
    tipo_avaliacao VARCHAR(50),
    nota DECIMAL(5,2),
    data_avaliacao DATE,
    FOREIGN KEY (id_matricula) REFERENCES tbl_matricula(id_matricula)
);