show databases;
create database veterinaria;
use veterinaria;

-- 1. Entidade TUTOR
CREATE TABLE tutor (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

-- 2. Entidade PET
CREATE TABLE pet (
    id_pet INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    especie VARCHAR(40) NOT NULL,
    cpf CHAR(11) NOT NULL,

    FOREIGN KEY (cpf) REFERENCES tutor(cpf)
);

-- 3. Entidade VETERINARIO
CREATE TABLE veterinario (
    crm VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- 4. Entidade CONSULTA (superclasse)
CREATE TABLE consulta (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    FOREIGN KEY (id_pet) REFERENCES pet(id_pet),
     FOREIGN KEY (crm) REFERENCES veterinario(crm)
);

-- 5. Subclasse EXAME (herda de CONSULTA)
CREATE TABLE exame (
    id_consulta INT PRIMARY KEY,
    tipo ENUM('Urina', 'Hemograma', 'Raio-X', 'Fezes') NOT NULL,
    resultado ENUM('Normal', 'Alterado'),

    FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta),
    FOREIGN KEY (id_pet) REFERENCES pet(id_pet),
    FOREIGN KEY (crm) REFERENCES veterinario(crm)
);

-- 6. Subclasse PROCEDIMENTO (herda de CONSULTA)
CREATE TABLE procedimento (
    id_consulta INT PRIMARY KEY,
    descricao-tipo VARCHAR(150) NOT NULL,

    FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta),
    FOREIGN KEY (id_pet) REFERENCES pet(id_pet),
    FOREIGN KEY (crm) REFERENCES veterinario(crm)
);



