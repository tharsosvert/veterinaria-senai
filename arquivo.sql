show databases;
create database veterinaria;
use veterinaria;

-- 1. Cadastro dos tutores
CREATE TABLE tutor (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

-- 2. Cadastro dos pets
CREATE TABLE pet (
    idPet INT AUTO_INCREMENT PRIMARY KEY,
    especie VARCHAR(40) NOT NULL,
    nome VARCHAR(30) NOT NULL,
    cpf CHAR(11) NOT NULL,

    CONSTRAINT fk_pet_tutor
        FOREIGN KEY (cpf)
        REFERENCES tutor(cpf)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

-- 3. Cadastro dos veterinarios
CREATE TABLE veterinario (
    crm VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- 4. Cadastro dos procedimentos
CREATE TABLE procedimento (
    codProc INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

-- 5. Cadastro das consultas
CREATE TABLE consulta (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    idPet INT NOT NULL,
    crm VARCHAR(20) NOT NULL,
    data_hora DATETIME NOT NULL,

    CONSTRAINT fk_consulta_pet
        FOREIGN KEY (idPet)
        REFERENCES pet(idPet)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,

    CONSTRAINT fk_consulta_veterinario
        FOREIGN KEY (crm)
        REFERENCES veterinario(crm)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

-- 6. Relacionamento entre consultas e procedimentos
CREATE TABLE consulta_procedimento (
    id_consulta INT NOT NULL,
    codProc INT NOT NULL,

    PRIMARY KEY (id_consulta, codProc),

    CONSTRAINT fk_cp_consulta
        FOREIGN KEY (id_consulta)
        REFERENCES consulta(id_consulta)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,

    CONSTRAINT fk_cp_procedimento
        FOREIGN KEY (codProc)
        REFERENCES procedimento(codProc)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

-- 7. Especializacao: castracao
CREATE TABLE castracao (
    codProc INT PRIMARY KEY,
    sexo VARCHAR(10) NOT NULL,

    CONSTRAINT fk_castracao_procedimento
        FOREIGN KEY (codProc)
        REFERENCES procedimento(codProc)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

-- 8. Especializacao: consulta de rotina
CREATE TABLE consulta_rotina (
    codProc INT PRIMARY KEY,
    reagendamento DATETIME,

    CONSTRAINT fk_rotina_procedimento
        FOREIGN KEY (codProc)
        REFERENCES procedimento(codProc)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

-- 9. Especializacao: vacinacao
CREATE TABLE vacinacao (
    codProc INT PRIMARY KEY,
    tipoVacina VARCHAR(50) NOT NULL,

    CONSTRAINT fk_vacinacao_procedimento
        FOREIGN KEY (codProc)
        REFERENCES procedimento(codProc)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

-- 10. Especializacao: emergencia
CREATE TABLE emergencia (
    codProc INT PRIMARY KEY,
    sintomas VARCHAR(255) NOT NULL,

    CONSTRAINT fk_emergencia_procedimento
        FOREIGN KEY (codProc)
        REFERENCES procedimento(codProc)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);
