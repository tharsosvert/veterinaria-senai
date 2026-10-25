show databases;
create database veterinaria;
use veterinaria;


CREATE TABLE tutor (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL
);


CREATE TABLE pet (
    id_pet INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    especie VARCHAR(40) NOT NULL,
    cpf CHAR(11) NOT NULL,

    FOREIGN KEY (cpf) REFERENCES tutor(cpf)
);


CREATE TABLE veterinario (
    crm VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);


CREATE TABLE consulta (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    id_pet INT NOT NULL,
    crm VARCHAR(20),
    
    FOREIGN KEY (id_pet) REFERENCES pet(id_pet),
    FOREIGN KEY (crm) REFERENCES veterinario(crm)
);

#EXAME (herda de CONSULTA)
CREATE TABLE exame (
    id_exame INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_consulta INT NOT NULL,
    tipo ENUM('Urina', 'Hemograma', 'Raio-X', 'Fezes') NOT NULL,
    resultado ENUM('Normal', 'Alterado'),
    id_pet INT NOT NULL,
    crm VARCHAR(20),
    
    FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta),
    FOREIGN KEY (id_pet) REFERENCES pet(id_pet),
    FOREIGN KEY (crm) REFERENCES veterinario(crm)
);

#PROCEDIMENTO (herda de CONSULTA)
CREATE TABLE procedimento (
    id_procedimento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_consulta INT NOT NULL,
    descricaoTipo VARCHAR(150) NOT NULL,
    id_pet INT NOT NULL,
    crm VARCHAR(20),
    
    FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta),
    FOREIGN KEY (id_pet) REFERENCES pet(id_pet),
    FOREIGN KEY (crm) REFERENCES veterinario(crm)
);


ALTER TABLE procedimento
DROP FOREIGN KEY procedimento_ibfk_1;

ALTER TABLE procedimento
DROP PRIMARY KEY;

ALTER TABLE procedimento
ADD COLUMN id_procedimento INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE procedimento
ADD CONSTRAINT fk_procedimento_consulta
FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta);

SHOW CREATE TABLE tutor;
SHOW CREATE TABLE pet;
SHOW CREATE TABLE veterinario;
SHOW CREATE TABLE consulta;
SHOW CREATE TABLE procedimento;
SHOW CREATE TABLE exame;


#tutores
INSERT INTO tutor (cpf, nome, telefone) VALUES
('00000000001','Ana Silva','11990000001'),
('00000000002','Bruno Souza','11990000002'),
('00000000003','Carla Lima','11990000003'),
('00000000004','Diego Costa','11990000004'),
('00000000005','Elisa Santos','11990000005'),
('00000000006','Felipe Alves','11990000006'),
('00000000007','Gabi Rocha','11990000007'),
('00000000008','Hugo Martins','11990000008'),
('00000000009','Iara Gomes','11990000009'),
('00000000010','João Ribeiro','11990000010'),
('00000000011','Karen Oliveira','11990000011'),
('00000000012','Lucas Ferreira','11990000012'),
('00000000013','Marina Carvalho','11990000013'),
('00000000014','Natan Barros','11990000014'),
('00000000015','Olivia Mendes','11990000015'),
('00000000016','Paulo Cardoso','11990000016'),
('00000000017','Queila Nunes','11990000017'),
('00000000018','Rafael Teixeira','11990000018'),
('00000000019','Sara Moreira','11990000019'),
('00000000020','Tiago Freitas','11990000020'),
('00000000021','Ursula Castro','11990000021'),
('00000000022','Vitor Correia','11990000022'),
('00000000023','Wesley Dias','11990000023'),
('00000000024','Yasmin Lopes','11990000024'),
('00000000025','Zeca Ramos','11990000025'),
('00000000026','Amanda Araujo','11990000026'),
('00000000027','Breno Xavier','11990000027'),
('00000000028','Cecilia Moraes','11990000028'),
('00000000029','Davi Pires','11990000029'),
('00000000030','Estela Farias','11990000030'),
('00000000031','Fabio Batista','11990000031'),
('00000000032','Giovana Reis','11990000032'),
('00000000033','Heitor Campos','11990000033'),
('00000000034','Isabela Pinto','11990000034'),
('00000000035','Jonas Melo','11990000035'),
('00000000036','Katia Monteiro','11990000036'),
('00000000037','Leandro Cunha','11990000037'),
('00000000038','Mirela Duarte','11990000038'),
('00000000039','Nelson Peixoto','11990000039'),
('00000000040','Priscila Moura','11990000040'),
('00000000041','Renato Tavares','11990000041'),
('00000000042','Sonia Braga','11990000042'),
('00000000043','Tatiana Lemos','11990000043'),
('00000000044','Ulisses Neves','11990000044'),
('00000000045','Valeria Dantas','11990000045'),
('00000000046','William Paiva','11990000046'),
('00000000047','Yuri Fonseca','11990000047'),
('00000000048','Zilda Macedo','11990000048'),
('00000000049','Andreia Leal','11990000049'),
('00000000050','Bernardo Queiroz','11990000050');


#pets
INSERT INTO pet (nome, especie, cpf) VALUES
('Mel','Cachorro','00000000001'),
('Nina','Gato','00000000002'),
('Thor','Cachorro','00000000003'),
('Luna','Gato','00000000004'),
('Bob','Coelho','00000000005'),
('Mimi','Ave','00000000006'),
('Max','Cachorro','00000000007'),
('Bela','Hamster','00000000008'),
('Pipoca','Porquinho-da-índia','00000000009'),
('Simba','Gato','00000000010'),
('Amora','Cachorro','00000000011'),
('Frajola','Gato','00000000012'),
('Toby','Tartaruga','00000000013'),
('Lola','Ave','00000000014'),
('Bidu','Cachorro','00000000015'),
('Kiara','Peixe','00000000016'),
('Fred','Cachorro','00000000017'),
('Cacau','Coelho','00000000018'),
('Pingo','Ave','00000000019'),
('Maya','Gato','00000000020'),
('Zeca','Cachorro','00000000021'),
('Julie','Iguana','00000000022'),
('Nino','Cachorro','00000000023'),
('Safira','Gato','00000000024'),
('Rocky','Porquinho-da-índia','00000000025'),
('Dora','Coelho','00000000026'),
('Bóris','Cachorro','00000000027'),
('Pérola','Ave','00000000028'),
('Caju','Peixe','00000000029'),
('Fiona','Gato','00000000030'),
('Bento','Cachorro','00000000031'),
('Meg','Hamster','00000000032'),
('Apolo','Cachorro','00000000033'),
('Lili','Coelho','00000000034'),
('Ozzy','Ave','00000000035'),
('Malu','Gato','00000000036'),
('Rex','Cachorro','00000000037'),
('Tina','Tartaruga','00000000038'),
('Chico','Ave','00000000039'),
('Frida','Gato','00000000040'),
('Sansão','Coelho','00000000041'),
('Paçoca','Cachorro','00000000042'),
('Tom','Peixe','00000000043'),
('Dengo','Cachorro','00000000044'),
('Jade','Iguana','00000000045'),
('Marley','Cachorro','00000000046'),
('Pudim','Porquinho-da-índia','00000000047'),
('Kiko','Ave','00000000048'),
('Estrela','Gato','00000000049'),
('Duque','Cachorro','00000000050');

#veterinários
INSERT INTO veterinario (crm, nome) VALUES
('CRM-SP-0001','Dra. Alice Prado'),
('CRM-SP-0002','Dr. Beto Nogueira'),
('CRM-SP-0003','Dra. Cintia Lopes'),
('CRM-SP-0004','Dr. Daniel Melo'),
('CRM-SP-0005','Dra. Erica Ramos'),
('CRM-SP-0006','Dr. Fabio Reis'),
('CRM-SP-0007','Dra. Gisele Alves'),
('CRM-SP-0008','Dr. Henrique Lima'),
('CRM-SP-0009','Dra. Iris Costa'),
('CRM-SP-0010','Dr. Julio Martins'),
('CRM-SP-0011','Dra. Karina Souza'),
('CRM-SP-0012','Dr. Leandro Dias'),
('CRM-SP-0013','Dra. Monica Rocha'),
('CRM-SP-0014','Dr. Nelson Silva'),
('CRM-SP-0015','Dra. Olivia Barros'),
('CRM-SP-0016','Dr. Pedro Gomes'),
('CRM-SP-0017','Dra. Quelia Castro'),
('CRM-SP-0018','Dr. Rafael Pires'),
('CRM-SP-0019','Dra. Sonia Freitas'),
('CRM-SP-0020','Dr. Tiago Araujo'),
('CRM-SP-0021','Dra. Ursula Mendes'),
('CRM-SP-0022','Dr. Vitor Teixeira'),
('CRM-SP-0023','Dra. Wanda Nunes'),
('CRM-SP-0024','Dr. Yuri Cardoso'),
('CRM-SP-0025','Dra. Zelia Ferreira'),
('CRM-SP-0026','Dra. Amanda Xavier'),
('CRM-SP-0027','Dr. Bruno Moraes'),
('CRM-SP-0028','Dra. Cecilia Pires'),
('CRM-SP-0029','Dr. Davi Campos'),
('CRM-SP-0030','Dra. Elisa Pinto'),
('CRM-SP-0031','Dr. Felipe Melo'),
('CRM-SP-0032','Dra. Gabriela Cunha'),
('CRM-SP-0033','Dr. Hugo Duarte'),
('CRM-SP-0034','Dra. Isabela Moura'),
('CRM-SP-0035','Dr. Jonas Tavares'),
('CRM-SP-0036','Dra. Katia Braga'),
('CRM-SP-0037','Dr. Lucas Leal'),
('CRM-SP-0038','Dra. Marina Queiroz'),
('CRM-SP-0039','Dr. Natan Peixoto'),
('CRM-SP-0040','Dra. Priscila Farias'),
('CRM-SP-0041','Dr. Renato Monteiro'),
('CRM-SP-0042','Dra. Sara Batista'),
('CRM-SP-0043','Dr. Ulisses Paiva'),
('CRM-SP-0044','Dra. Valeria Lemos'),
('CRM-SP-0045','Dr. William Correia'),
('CRM-SP-0046','Dra. Yasmin Macedo'),
('CRM-SP-0047','Dr. Andre Fonseca'),
('CRM-SP-0048','Dra. Beatriz Dantas'),
('CRM-SP-0049','Dr. Caio Farias'),
('CRM-SP-0050','Dra. Denise Ramos');


#consultas
INSERT INTO consulta (data_hora, id_pet, crm) VALUES
('2025-01-01 09:00:00', 1, 'CRM-SP-0001'),
('2025-01-02 09:00:00', 2, 'CRM-SP-0002'),
('2025-01-03 09:00:00', 3, 'CRM-SP-0003'),
('2025-01-04 09:00:00', 4, 'CRM-SP-0004'),
('2025-01-05 09:00:00', 5, 'CRM-SP-0005'),
('2025-01-06 09:00:00', 6, 'CRM-SP-0006'),
('2025-01-07 09:00:00', 7, 'CRM-SP-0007'),
('2025-01-08 09:00:00', 8, 'CRM-SP-0008'),
('2025-01-09 09:00:00', 9, 'CRM-SP-0009'),
('2025-01-10 09:00:00', 10, 'CRM-SP-0010'),
('2025-01-11 09:00:00', 11, 'CRM-SP-0011'),
('2025-01-12 09:00:00', 12, 'CRM-SP-0012'),
('2025-01-13 09:00:00', 13, 'CRM-SP-0013'),
('2025-01-14 09:00:00', 14, 'CRM-SP-0014'),
('2025-01-15 09:00:00', 15, 'CRM-SP-0015'),
('2025-01-16 09:00:00', 16, 'CRM-SP-0016'),
('2025-01-17 09:00:00', 17, 'CRM-SP-0017'),
('2025-01-18 09:00:00', 18, 'CRM-SP-0018'),
('2025-01-19 09:00:00', 19, 'CRM-SP-0019'),
('2025-01-20 09:00:00', 20, 'CRM-SP-0020'),
('2025-01-21 09:00:00', 21, 'CRM-SP-0021'),
('2025-01-22 09:00:00', 22, 'CRM-SP-0022'),
('2025-01-23 09:00:00', 23, 'CRM-SP-0023'),
('2025-01-24 09:00:00', 24, 'CRM-SP-0024'),
('2025-01-25 09:00:00', 25, 'CRM-SP-0025'),
('2025-01-26 09:00:00', 26, 'CRM-SP-0026'),
('2025-01-27 09:00:00', 27, 'CRM-SP-0027'),
('2025-01-28 09:00:00', 28, 'CRM-SP-0028'),
('2025-01-29 09:00:00', 29, 'CRM-SP-0029'),
('2025-01-30 09:00:00', 30, 'CRM-SP-0030'),
('2025-01-31 09:00:00', 31, 'CRM-SP-0031'),
('2025-02-01 09:00:00', 32, 'CRM-SP-0032'),
('2025-02-02 09:00:00', 33, 'CRM-SP-0033'),
('2025-02-03 09:00:00', 34, 'CRM-SP-0034'),
('2025-02-04 09:00:00', 35, 'CRM-SP-0035'),
('2025-02-05 09:00:00', 36, 'CRM-SP-0036'),
('2025-02-06 09:00:00', 37, 'CRM-SP-0037'),
('2025-02-07 09:00:00', 38, 'CRM-SP-0038'),
('2025-02-08 09:00:00', 39, 'CRM-SP-0039'),
('2025-02-09 09:00:00', 40, 'CRM-SP-0040'),
('2025-02-10 09:00:00', 41, 'CRM-SP-0041'),
('2025-02-11 09:00:00', 42, 'CRM-SP-0042'),
('2025-02-12 09:00:00', 43, 'CRM-SP-0043'),
('2025-02-13 09:00:00', 44, 'CRM-SP-0044'),
('2025-02-14 09:00:00', 45, 'CRM-SP-0045'),
('2025-02-15 09:00:00', 46, 'CRM-SP-0046'),
('2025-02-16 09:00:00', 47, 'CRM-SP-0047'),
('2025-02-17 09:00:00', 48, 'CRM-SP-0048'),
('2025-02-18 09:00:00', 49, 'CRM-SP-0049'),
('2025-02-19 09:00:00', 50, 'CRM-SP-0050');

#exames
InSERT INTO exame (id_consulta, tipo, resultado, id_pet, crm) VALUES
(1, 'Urina', 'Normal', 1, 'CRM-SP-0001'),
(2, 'Hemograma', 'Alterado', 2, 'CRM-SP-0002'),
(3, 'Raio-X', 'Normal', 3, 'CRM-SP-0003'),
(4, 'Fezes', 'Normal', 4, 'CRM-SP-0004'),
(5, 'Urina', 'Alterado', 5, 'CRM-SP-0005'),
(6, 'Hemograma', 'Normal', 6, 'CRM-SP-0006'),
(7, 'Raio-X', 'Alterado', 7, 'CRM-SP-0007'),
(8, 'Fezes', 'Normal', 8, 'CRM-SP-0008'),
(9, 'Urina', 'Normal', 9, 'CRM-SP-0009'),
(10, 'Hemograma', 'Alterado', 10, 'CRM-SP-0010'),
(11, 'Raio-X', 'Normal', 11, 'CRM-SP-0011'),
(12, 'Fezes', 'Alterado', 12, 'CRM-SP-0012'),
(13, 'Urina', 'Normal', 13, 'CRM-SP-0013'),
(14, 'Hemograma', 'Normal', 14, 'CRM-SP-0014'),
(15, 'Raio-X', 'Alterado', 15, 'CRM-SP-0015'),
(16, 'Fezes', 'Normal', 16, 'CRM-SP-0016'),
(17, 'Urina', 'Alterado', 17, 'CRM-SP-0017'),
(18, 'Hemograma', 'Normal', 18, 'CRM-SP-0018'),
(19, 'Raio-X', 'Normal', 19, 'CRM-SP-0019'),
(20, 'Fezes', 'Alterado', 20, 'CRM-SP-0020'),
(21, 'Urina', 'Normal', 21, 'CRM-SP-0021'),
(22, 'Hemograma', 'Alterado', 22, 'CRM-SP-0022'),
(23, 'Raio-X', 'Normal', 23, 'CRM-SP-0023'),
(24, 'Fezes', 'Normal', 24, 'CRM-SP-0024'),
(25, 'Urina', 'Alterado', 25, 'CRM-SP-0025');

#procedimentos
INSERT INTO procedimento (id_consulta, descricaoTipo, id_pet, crm) VALUES
(26, 'Vacinação', 26, 'CRM-SP-0026'),
(27, 'Castração', 27, 'CRM-SP-0027'),
(28, 'Curativo', 28, 'CRM-SP-0028'),
(29, 'Limpeza dentária', 29, 'CRM-SP-0029'),
(30, 'Aplicação de medicação', 30, 'CRM-SP-0030'),
(31, 'Vacinação', 31, 'CRM-SP-0031'),
(32, 'Castração', 32, 'CRM-SP-0032'),
(33, 'Curativo', 33, 'CRM-SP-0033'),
(34, 'Limpeza dentária', 34, 'CRM-SP-0034'),
(35, 'Aplicação de medicação', 35, 'CRM-SP-0035'),
(36, 'Vacinação', 36, 'CRM-SP-0036'),
(37, 'Castração', 37, 'CRM-SP-0037'),
(38, 'Curativo', 38, 'CRM-SP-0038'),
(39, 'Limpeza dentária', 39, 'CRM-SP-0039'),
(40, 'Aplicação de medicação', 40, 'CRM-SP-0040'),
(41, 'Vacinação', 41, 'CRM-SP-0041'),
(42, 'Castração', 42, 'CRM-SP-0042'),
(43, 'Curativo', 43, 'CRM-SP-0043'),
(44, 'Limpeza dentária', 44, 'CRM-SP-0044'),
(45, 'Aplicação de medicação', 45, 'CRM-SP-0045'),
(46, 'Vacinação', 46, 'CRM-SP-0046'),
(47, 'Castração', 47, 'CRM-SP-0047'),
(48, 'Curativo', 48, 'CRM-SP-0048'),
(49, 'Limpeza dentária', 49, 'CRM-SP-0049'),
(50, 'Aplicação de medicação', 50, 'CRM-SP-0050');

#consultas com SELECT e WHERE
SELECT * FROM tutor WHERE nome = 'Ana Silva';
SELECT * FROM pet WHERE especie = 'Gato';
SELECT * FROM consulta WHERE data_hora >= '2025-02-01';

#comparação
SELECT * FROM pet WHERE especie = 'Gato';
SELECT * FROM exame WHERE resultado != 'Normal';
SELECT * FROM consulta WHERE id_consulta > 25;

# consultas com GROUP BY e ORDER BY com funções de agregação
SELECT crm FROM consulta GROUP BY crm ORDER BY crm;
SELECT especie FROM pet GROUP BY especie ORDER BY especie;
SELECT tipo FROM exame GROUP BY tipo ORDER BY tipo;

#consultas com operadores aritméticos
SELECT id_pet, id_pet + 10 FROM pet;
SELECT id_consulta, id_consulta - 1 FROM consulta;
SELECT id_exame, id_exame * 2, id_exame / 2 FROM exame;

#consultas com operadores de comparação 
SELECT * FROM pet WHERE especie = 'Gato';
SELECT * FROM exame WHERE resultado != 'Normal';
SELECT * FROM consulta WHERE id_consulta > 25;


#consultas com operadores lógicos (AND, OR)
SELECT * FROM exame WHERE tipo = 'Urina' AND resultado = 'Normal';
SELECT * FROM pet WHERE especie = 'Gato' OR especie = 'Coelho';
SELECT * FROM consulta WHERE id_pet <= 10 OR id_pet >= 40;

#consultas com operadores lógicos e negação
SELECT * FROM pet WHERE NOT especie = 'Cachorro';
SELECT * FROM exame WHERE NOT resultado = 'Normal';

#consultas com operadores auxiliares
SELECT * FROM consulta WHERE crm IS NULL;
SELECT * FROM consulta WHERE data_hora BETWEEN '2025-01-01' AND '2025-01-31 23:59:59';
SELECT * FROM pet WHERE nome LIKE 'M%'; #nomes qiue começas com M
SELECT * FROM pet WHERE especie IN ('Gato', 'Coelho', 'Ave');
SELECT * FROM exame WHERE resultado IS NOT NULL;

#consultas com funções de agregação
SELECT SUM(id_exame) FROM exame; #soma todos os valores da coluna
SELECT AVG(id_exame) FROM exame; #média dos valores
SELECT MAX(id_exame) FROM exame; #maior valor

# consultas com funções de datas
SELECT NOW();
SELECT DATE(data_hora) FROM consulta;
SELECT YEAR(data_hora) FROM consulta GROUP BY YEAR(data_hora);

#sub-consultas com agrupamento e união de dados
SELECT nome FROM pet WHERE id_pet IN (SELECT id_pet FROM consulta GROUP BY id_pet);
SELECT nome FROM pet WHERE id_pet IN (SELECT id_pet FROM consulta);
SELECT tipo_registro FROM (SELECT 'Exame' tipo_registro FROM exame
 UNION ALL #junta o resultado de duas consultas
SELECT 'Procedimento' FROM procedimento) atendimentos GROUP BY tipo_registro;

