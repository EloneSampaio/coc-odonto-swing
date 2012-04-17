--DROP TABLE APP.PACIENTE;

CREATE TABLE APP.PACIENTE
(
ID  INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
NOME VARCHAR(255),
RG VARCHAR(20),
CPF VARCHAR(20),
SEXO VARCHAR(1),	
RESPONSAVEL_POR INTEGER
)
;

--DROP TABLE APP.CONTATO;

CREATE TABLE APP.CONTATO
(
ID  INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
EMAIL VARCHAR(255),
TELEFONE VARCHAR(20),
FAX VARCHAR(20),
CELULAR VARCHAR(20)
)
;

--DROP TABLE APP.PACIENTE_CONTATO;
CREATE TABLE APP.PACIENTE_CONTATO
(
PACIENTE_ID INTEGER,
CONTATO_ID INTEGER
)
;
--DROP TABLE APP.ENDERECO;
CREATE TABLE APP.ENDERECO
(
ID  INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
ENDERECO VARCHAR(255),
CIDADE VARCHAR(255),
CEP VARCHAR(20),
BAIRRO VARCHAR(255)
)
;

CREATE TABLE APP.PACIENTE_ENDERECO
(
PACIENTE_ID INTEGER,
ENDERECO_ID INTEGER
)
;

CREATE TABLE APP.CONSULTA
(
ID  INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
VALOR DOUBLE,
DATACRIACAO DATE,
DENTISTA_ID INTEGER,
PACIENTE_ID INTEGER
)
;

--DROP TABLE APP.CONTRATO;

CREATE TABLE APP.CONTRATO
(
ID  INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
PACIENTE_ID INTEGER,
DENTISTA_ID INTEGER,
EM_NOME_DO_PACIENTE_ID INTEGER
)
;

--DROP TABLE APP.PAGAMENTO;
CREATE TABLE APP.PAGAMENTO
(
ID INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
CONTRATO_ID INTEGER,
DATA_PAGAMENTO DATE,
DATA_VENCIMENTO DATE,
VALOR DOUBLE,
JUROS DOUBLE,
TIPO_JUROS VARCHAR(20)
)
;
--DROP TABLE APP.DENTISTA;
CREATE TABLE APP.DENTISTA
(
ID  INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
CRO VARCHAR(20),
NOME VARCHAR(255),
CPF VARCHAR(20)
)
;
--DROP TABLE APP.DENTISTA_CONTATO;
CREATE TABLE APP.DENTISTA_CONTATO
(
DENTISTA_ID INTEGER,
CONTATO_ID INTEGER
)
;

--DROP TABLE APP.DENTISTA_ENDERECO;

CREATE TABLE APP.DENTISTA_ENDERECO
(
DENTISTA_ID INTEGER,
ENDERECO_ID INTEGER
)
;
--DROP TABLE APP.PROCEDIMENTO;
CREATE TABLE APP.PROCEDIMENTO
(
ID  INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
NOME VARCHAR(255),
DESCRICAO VARCHAR(255),
DATACRIACAO DATE
)
;

--DROP TABLE APP.CONSULTA_PROCEDIMENTO;

CREATE TABLE APP.CONSULTA_PROCEDIMENTO
(
CONSULTA_ID INTEGER,
PROCEDIMENTO_ID INTEGER
)
;

ALTER TABLE APP.PACIENTE
ADD CONSTRAINT PACIENTE_PK PRIMARY KEY
(
ID
)
 
;

ALTER TABLE APP.CONTATO
ADD CONSTRAINT CONTATO_PK PRIMARY KEY
(
ID
)
 
;

ALTER TABLE APP.ENDERECO
ADD CONSTRAINT ENDERECO_PK PRIMARY KEY
(
ID
)
 
;

ALTER TABLE APP.CONSULTA
ADD CONSTRAINT CONSULTA_PK PRIMARY KEY
(
ID
)
 
;

ALTER TABLE APP.CONTRATO
ADD CONSTRAINT CONTRATO_PK PRIMARY KEY
(
ID
)
 
;

ALTER TABLE APP.PAGAMENTO
ADD CONSTRAINT PAGAMENTO_PK PRIMARY KEY
(
ID
)
 
;

ALTER TABLE APP.DENTISTA
ADD CONSTRAINT DENTISTA_PK PRIMARY KEY
(
ID
)
 
;

ALTER TABLE APP.PROCEDIMENTO
ADD CONSTRAINT PROCEDIMENTO_PK PRIMARY KEY
(
ID
)
 
;

ALTER TABLE APP.PACIENTE
ADD CONSTRAINT PACIENTE_PACIENTE_FK FOREIGN KEY
(
RESPONSAVEL_POR
)
REFERENCES APP.PACIENTE
(
ID
) 
;

ALTER TABLE APP.PACIENTE_CONTATO
ADD CONSTRAINT PACIENTE_CONTATO_PACIENTE_FK FOREIGN KEY
(
PACIENTE_ID
)
REFERENCES APP.PACIENTE
(
ID
) 
;

ALTER TABLE APP.PACIENTE_CONTATO
ADD CONSTRAINT PACIENTE_CONTATO_CONTATO_FK FOREIGN KEY
(
CONTATO_ID
)
REFERENCES APP.CONTATO
(
ID
) 
;

ALTER TABLE APP.PACIENTE_ENDERECO
ADD CONSTRAINT PACIENTE_ENDERECO_PACIENTE_FK FOREIGN KEY
(
PACIENTE_ID
)
REFERENCES APP.PACIENTE
(
ID
) 
;

ALTER TABLE APP.PACIENTE_ENDERECO
ADD CONSTRAINT PACIENTE_ENDERECO_ENDERECO_FK FOREIGN KEY
(
ENDERECO_ID
)
REFERENCES APP.ENDERECO
(
ID
) 
;

ALTER TABLE APP.CONSULTA
ADD CONSTRAINT CONSULTA_DENTISTA_FK FOREIGN KEY
(
DENTISTA_ID
)
REFERENCES APP.DENTISTA
(
ID
) 
;

ALTER TABLE APP.CONSULTA
ADD CONSTRAINT CONSULTA_PACIENTE_FK FOREIGN KEY
(
PACIENTE_ID
)
REFERENCES APP.PACIENTE
(
ID
) 
;

ALTER TABLE APP.CONTRATO
ADD CONSTRAINT CONTRATO_PACIENTE_FK FOREIGN KEY
(
PACIENTE_ID
)
REFERENCES APP.PACIENTE
(
ID
) 
;

ALTER TABLE APP.CONTRATO
ADD CONSTRAINT CONTRATO_PACIENTE_FK1 FOREIGN KEY
(
EM_NOME_DO_PACIENTE_ID
)
REFERENCES APP.PACIENTE
(
ID
) 
;

ALTER TABLE APP.CONTRATO
ADD CONSTRAINT CONTRATO_DENTISTA_FK FOREIGN KEY
(
DENTISTA_ID
)
REFERENCES APP.DENTISTA
(
ID
) 
;

ALTER TABLE APP.PAGAMENTO
ADD CONSTRAINT PAGAMENTO_CONTRATO_FK FOREIGN KEY
(
CONTRATO_ID
)
REFERENCES APP.CONTRATO
(
ID
) 
;

ALTER TABLE APP.DENTISTA_CONTATO
ADD CONSTRAINT DENTISTA_CONTATO_DENTISTA_FK FOREIGN KEY
(
DENTISTA_ID
)
REFERENCES APP.DENTISTA
(
ID
) 
;

ALTER TABLE APP.DENTISTA_CONTATO
ADD CONSTRAINT DENTISTA_CONTATO_CONTATO_FK FOREIGN KEY
(
CONTATO_ID
)
REFERENCES APP.CONTATO
(
ID
) 
;

ALTER TABLE APP.DENTISTA_ENDERECO
ADD CONSTRAINT DENTISTA_ENDERECO_DENTISTA_FK FOREIGN KEY
(
DENTISTA_ID
)
REFERENCES APP.DENTISTA
(
ID
) 
;

ALTER TABLE APP.DENTISTA_ENDERECO
ADD CONSTRAINT DENTISTA_ENDERECO_ENDERECO_FK FOREIGN KEY
(
ENDERECO_ID
)
REFERENCES APP.ENDERECO
(
ID
) 
;

ALTER TABLE APP.CONSULTA_PROCEDIMENTO
ADD CONSTRAINT CONSULTA_PROCEDIMENTO_FK FOREIGN KEY
(
CONSULTA_ID
)
REFERENCES APP.CONSULTA
(
ID
) 
;

ALTER TABLE APP.CONSULTA_PROCEDIMENTO
ADD CONSTRAINT CONSULTA_PROCEDIMENTO_FK1 FOREIGN KEY
(
PROCEDIMENTO_ID
)
REFERENCES APP.PROCEDIMENTO
(
ID
) 
;

