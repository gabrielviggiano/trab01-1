DROP TABLE IF EXISTS Pessoa CASCADE;
DROP TABLE IF EXISTS Tipo_Contato CASCADE;
DROP TABLE IF EXISTS Exame CASCADE;
DROP TABLE IF EXISTS Especialidade CASCADE;
DROP TABLE IF EXISTS Paciente CASCADE;
DROP TABLE IF EXISTS Medico CASCADE;
DROP TABLE IF EXISTS Bairro CASCADE;
DROP TABLE IF EXISTS Cidade CASCADE;
DROP TABLE IF EXISTS Contato CASCADE;
DROP TABLE IF EXISTS Unidade CASCADE;
DROP TABLE IF EXISTS Exame_Paciente CASCADE;

CREATE TABLE Pessoa (
    ID_Pessoa INTEGER,
    NM_Pessoa VARCHAR,
    PRIMARY KEY(ID_Pessoa)
);

CREATE TABLE Tipo_Contato (
    CD_Tipo INTEGER,
    NM_Tipo VARCHAR,
    PRIMARY KEY (CD_Tipo)
);

CREATE TABLE Exame (
    CD_Exame INTEGER,
    Tipo_Exame VARCHAR,
    Preco FLOAT,
    PRIMARY KEY (CD_Exame)
);

CREATE TABLE Especialidade (
    CD_Especialidade INTEGER,
    NM_Especialidade VARCHAR,
    PRIMARY KEY (CD_Especialidade)
);

CREATE TABLE Paciente (
    fk_Pessoa_ID_Pessoa INTEGER PRIMARY KEY,
    CPF_Paciente BIGINT,
    Senha VARCHAR
);

CREATE TABLE Medico (
    fk_Pessoa_ID_Pessoa INTEGER,
    CD_Especialidade INTEGER,
    CRM_Medico VARCHAR,
    Senha VARCHAR,
    PRIMARY KEY (CRM_Medico),
    FOREIGN KEY (CD_Especialidade) REFERENCES Especialidade(CD_Especialidade)
);

CREATE TABLE Bairro (
    CD_Bairro INTEGER,
    NM_Bairro VARCHAR,
    PRIMARY KEY(CD_Bairro)
);

CREATE TABLE Cidade (
    CD_Cidade INTEGER,
    NM_Cidade VARCHAR,
    PRIMARY KEY(CD_Cidade)
);

CREATE TABLE Contato (
    ID_Contato INTEGER,
    ID_Pessoa INTEGER,
    CD_Tipo INTEGER,
    NM_Contato VARCHAR,
    PRIMARY KEY (ID_Contato),
    FOREIGN KEY (ID_Pessoa) REFERENCES Pessoa(ID_Pessoa),
    FOREIGN KEY (CD_Tipo) REFERENCES Tipo_Contato(CD_Tipo)
);

CREATE TABLE Unidade (
    fk_Pessoa_ID_Pessoa INTEGER PRIMARY KEY,
    CNPJ BIGINT,
    NM_Rua VARCHAR,
    CD_Bairro INTEGER,
    Complemento VARCHAR,
    CEP BIGINT,
    Numero INTEGER,
    CD_Cidade INTEGER,                                        
    FOREIGN KEY (CD_Bairro) REFERENCES Bairro(CD_Bairro),
    FOREIGN KEY (CD_Cidade) REFERENCES Cidade(CD_Cidade)
);

CREATE TABLE Exame_Paciente (
    CD_Exame_Paciente INTEGER,
    ID_Pessoa INTEGER,
    CD_Exame INTEGER,
    CRM_Medico VARCHAR,
    DT_Exame DATE,
    Realizado CHAR,
    PRIMARY KEY (CD_Exame_Paciente),
    FOREIGN KEY (ID_Pessoa) REFERENCES Pessoa(ID_Pessoa),
    FOREIGN KEY (CD_Exame) REFERENCES Exame(CD_Exame),
    FOREIGN KEY (CRM_Medico) REFERENCES Medico(CRM_Medico)
);

INSERT INTO Pessoa (ID_Pessoa, NM_Pessoa)
VALUES 	(1,	'Leonardo'),
(2,	'Jaqueline'),
(3,	'Guilherme'),
(4,	'Megan'),
(5,	'Pedro'),
(6,	'Amanda'),
(7,	'Vitor'),
(8,	'Luiz'),
(9,	'Henrique'),
(10,	'Melissa'),
(11,	'Fernando Castro'),
(12, 'Daiane Lima'),
(13,	'Pedro Gusmão'),
(14,	'Ricardo Rocha'),
(15,	'Pedro Kawak'),
(16,	'Lucia Freuli'),
(17,	'Klaus Hardor'),
(18,	'Jessica Costa'),
(19,	'Tereza Santos'),
(20,	'Poliane Heber'),
(21,	'Unidade 1'),
(22,	'Unidade 2'),
(23,	'Unidade 3'),
(24,	'Unidade 4'),
(25,	'Unidade 5'),
(26,	'Unidade 6'),
(27,	'Unidade 7'),
(28,	'Unidade 8'),
(29,	'Unidade 9'),
(30,	'Unidade 10');

INSERT INTO Paciente (fk_pessoa_ID_Pessoa, CPF_Paciente, Senha)
VALUES (1,	12345678961,	'senha123'),
(2,	15325835675,	'jaque123'),
(3,	15325835672,	'lala123'),
(4,	15325835673,	'megan2233'),
(5,	15325835658,	'kaka1232'),
(6,	15325835698,	'h1234212'),
(7,	15325835696,	'gj2342'),
(8,	15325835684,	'lick1245'),
(9,	15325835682,	'henq2345'),
(10,	15325835689,	'mo23234');

INSERT INTO Bairro (CD_Bairro, NM_Bairro)
VALUES (10,	'JARDIM CAMBURI'),
(11,	'JARDIM DA PENHA'),
(12, 'PRAIA DO CANTO'),
(13,	'SANTA LUCIA'),
(14,	'GOIABEIRAS'),
(15,	'CENTRO'),
(16,	'JACARAIPE'),
(17,	'MANGUINHOS'),
(18,	'LARANJEIRAS'),
(19,	'JABOUR');

INSERT INTO Cidade (CD_Cidade, NM_Cidade)
VALUES (60,	'VITORIA'),
(61,	'SERRA'),
(62,	'VILA VELHA'),
(63,	'VIANA'),
(64,	'GUARAPARI'),
(65,	'CARIACICA'),
(66,	'FUNDÃO'),
(67,	'PEDRA AZUL'),
(68,	'DOMINGOS MARTINS'),
(69,	'VENDA NOVA');

INSERT INTO Unidade (fk_pessoa_ID_Pessoa, CNPJ, NM_Rua, CD_Bairro, Complemento, CEP, Numero, CD_Cidade)
VALUES (21,	52866580000106,	'Rua José Pedro',	10,	'apt 404',	29090319,	123,	60),
(22,	52866580000206,	'Rua Joao Louci',	    16,	'apt 320',	29090239,	133,	61),
(23,	52866580000306,	'Rua Jose Celso',	    13,	'apt 401',	29010232,	169,	60),
(24,	52866580000406,	'Rua Mariane',	        19,	'apt 102',	29012982,	190,	60),
(25,	52866580000506,	'Rua Rio Branco',	    10,	'apt 301',	29090410,	200,	60),
(26,	52866580000606,	'Rua Zima de Souza',	17,	'apt 1400',	29090123,	210,	61),
(27,	52866580000706,	'Rua Chapot',	        14,	'apt 302',	27323123,	330,	60),
(28,	52866580000806,	'Rua Santana',	        10,	'apt 1001',	20323111,	442,	61),
(29,	52866580000906,	'Rua Dom Juan',	        11,	'apt 704',	10293233,	113,	60),
(30,	52866580001006,	'Rua Marieta',	        14,	'apt 801',	27323221,	116,	60);

INSERT INTO Tipo_Contato (CD_Tipo, NM_Tipo)
VALUES (101,	'Email'),
(102,	'Telefone Fixo'),
(103,	'Telefone Celular'),
(104,	'Fax'),
(105,	'Telefone Empresa');

INSERT INTO Exame (CD_Exame, Tipo_Exame, Preco)
VALUES (1,	'R.M',	300.00),
(2,	'Urina',	200.00),
(3,	'Gravidez',	100.00),
(4,	'Raio-X',	210.00),
(5,	'HIV',	90.00),
(6,	'Glicose',	700.00),
(7,	'DNA', 130.00),
(8,	'Sanguíneo Completo',	200.00),
(9,	'Meningite',	200.00),
(10,	'Sífilis',	300.00);

INSERT INTO Especialidade (CD_Especialidade, NM_Especialidade)
VALUES (30,	'Geral'),
(31,	'Cardiologista'),
(32,	'Ortopedista'),
(33,	'Dentista'),
(34,	'Neurologista'),
(35,	'Ginecologista'),
(36,	'Obstetra'),
(37,	'Anestesista'),
(38,	'Pediatra'),
(39,	'Dermatologista');

INSERT INTO Medico (fk_pessoa_ID_Pessoa, CD_Especialidade, CRM_Medico, Senha)
VALUES (11,	30,	'17211 ES',	'1i2n3'),
(12,	38,	'11467 ES',	'i1jk23'),
(13,	32,	'12342 ES',	'i31bni3'),
(14,	36,	'11234 ES',	'31iu23'),
(15,	31,	'11532 ES',	'567pkas'),
(16,	30,	'17231 ES',	'a9s8da'),
(17,	34,	'19203 ES',	'd9a87ds'),
(18,	30,	'12341 ES',	'f8a09s'),
(19,	31,	'19062 ES',	'd7a6dsa'),
(20,	33,	'15612 ES',	'0d9f8g');

INSERT INTO Contato (ID_Contato, ID_Pessoa, CD_Tipo, NM_Contato)
VALUES (1,	1,	103,	'997637123'),
(2,	2,	103,	'999324789'),
(3,	3,	103,	'987120182'),
(4,	4,	102,	'33109827'),
(5,	5,	103,	'994620192'),
(6,	6,	101,	'amanda12@gmail.com'),
(8,	8,	103,	'991327462'),
(9,	9,	103,	'997162302'),
(10,	10,	103,	'991723873');

INSERT INTO Exame_Paciente (CD_Exame_Paciente, ID_Pessoa, CD_Exame, CRM_Medico, DT_Exame, Realizado)
VALUES (1, 1, 1, '17231 ES', '14/10/2019', 'N'), 
(2, 2, 1, '11467 ES', '15/4/2019', 'S'),
(3, 3, 2, '12341 ES', '16/9/2019', 'N'),
(4,	4, 4, '11234 ES', '17/5/2019', 'S'),
(5, 5, 5, '11532 ES' ,'18/10/2019', 'N'),
(6,	6,	6, '17231 ES', '1/10/2019',	'S'),
(7,	7,	2, '19203 ES', '21/11/2019', 'S'),
(8,	8,	6, '12341 ES', '21/10/2019', 'N'),
(9,	9,	9, '19062 ES', '5/5/2019', 'S'),
(10, 10, 10, '15612 ES', '23/10/2019','N');
