
DROP TABLE DIM_TEMPO ;
DROP TABLE DIM_CLIENTE;
DROP TABLE DIM_TIPO_PAGAMENTO;
DROP TABLE DIM_VENDEDORES;
DROP TABLE DIM_TRANSPORTE;
DROP TABLE DIM_PRODUTO;
DROP TABLE FATO_VENDA;
DROP TABLE FATO_LOCACAO;

---------------------------------------------------------------------------
--              SCRIPT DO MODELO ESTRELA FATO-LOCA��O                      --
---------------------------------------------------------------------------

-- -----------------------------------------------------
-- TABELA DE DIM_TEMPO`
-- -----------------------------------------------------


CREATE TABLE DIM_TEMPO
(  
  Id_Tempo int IDENTITY(1,1) NOT NULL,
  Nivel varchar(8) NOT NULL,
  Data datetime NULL,  
  Dia smallint NULL,
  DiaSemana varchar(25) NULL,
  DiaUtil char(3) NULL,
  Feriado char(3) NULL,
  TipoFeriado varchar(50) NULL DEFAULT('N�O � FERIADO'), 
  FimSemana char(3) NULL, 
  Quinzena smallint NULL,
  Mes smallint NULL, 
  NomeMes varchar(20) NULL,
  FimMes char(3) NULL,
  Trimestre smallint NULL, 
  NomeTrimestre varchar(20) NULL,
  Semestre smallint NULL,
  NomeSemestre varchar(20) NULL,
  Ano smallint NOT NULL, 
  PRIMARY KEY (Id_Tempo) 
  )

-- -----------------------------------------------------
-- TABELA DE DIM_CLIENTE
-- -----------------------------------------------------


CREATE TABLE DIM_CLIENTE (
  ID_CLIENTE INT IDENTITY (1,1) NOT NULL,
  NOME VARCHAR(45) NULL,
  DATA_NASCIMENTO DATE NULL,
  MATRICULA INT NULL,
  EMAIL VARCHAR(45) NULL,
  RUA VARCHAR(45) NULL,
  BAIRRO VARCHAR(45) NULL,
  CEP VARCHAR(10) NULL,
  CIDADE VARCHAR(45) NULL,
  SETADO VARCHAR(45) NULL,
  SEXO CHAR(1) NULL,
  CPF VARCHAR(15) NULL,
  RG INT NULL,
  PRIMARY KEY (ID_CLIENTE))

-- -----------------------------------------------------
-- TABELA PARA `DIM_TIPO_PAGAMENTO`
-- -----------------------------------------------------


CREATE TABLE DIM_TIPO_PAGAMENTO (
  ID_TIPO_PAGAMENTO INT IDENTITY (1,1) NOT NULL,
  COD_TIPO_PAGAMENTO INT NULL,
  TIPO_PAGAMENTO VARCHAR(25) NULL CHECK (TIPO_PAGAMENTO IN ('A VISTA NO DINHEIRO', 'AVISTA NO CARTAO')),
  PRIMARY KEY (ID_TIPO_PAGAMENTO))

-- -----------------------------------------------------
-- TABELA DE `DIM_VENDEDORES`
-- -----------------------------------------------------


CREATE TABLE DIM_VENDEDORES (
  ID_VENDEDORES INT IDENTITY (1,1) NOT NULL,
  NOME VARCHAR(45) NULL,
  MATRICULA INT NULL,
  LOGIN VARCHAR(45) NULL,
  SENHA VARCHAR(45) NULL,
  EMAIL VARCHAR(45) NULL,
  TELEFONE VARCHAR(16) NULL,
  SEXO CHAR(1) NULL,
  RUA VARCHAR(45) NULL,
  BAIRRO VARCHAR(45) NULL,
  CEP VARCHAR(10) NULL,
  CIDADE VARCHAR(45) NULL,
  UF VARCHAR(2) NULL,
  RG INT NULL,
  CPF VARCHAR(14) NULL,
  PRIMARY KEY (ID_VENDEDORES))

-- -----------------------------------------------------
-- TABELA DE 'DIM_CATEGORIA`
-- -----------------------------------------------------


/*CREATE TABLE DIM_CATEGORIA (
  ID_CATEGORIA INT IDENTITY (1,1) NOT NULL,
  CATEGORIA VARCHAR(45) NULL,
  PRIMARY KEY (ID_CATEGORIA))
  */
-- -----------------------------------------------------
-- TABELA DE `DIM_TRANSPORTE`
-- -----------------------------------------------------


CREATE TABLE DIM_TRANSPORTE (
  ID_TRANSPORTE INT IDENTITY(1,1) NOT NULL,
  COD_TRANSPORTE INT NULL,
  DESCRICAO VARCHAR(25) NULL CHECK (DESCRICAO IN ('PRESENCIAL', 'A DOMICILIO')),
  ENDERECO VARCHAR(50) NULL,
  PRIMARY KEY (ID_TRANSPORTE))
  
-- -----------------------------------------------------
-- TABELA DE `DIM_PRODUTO`
-- -----------------------------------------------------


CREATE TABLE DIM_PRODUTO (
  ID_PRODUTO INT IDENTITY (1,1) NOT NULL,
  NOME VARCHAR(45) NULL,
  CATEGORIA VARCHAR(45) NULL,
  STATUS_PRODUTO VARCHAR(25) NULL CHECK (STATUS_PRODUTO IN ('SEM DEFEITO','COM DEFEITO'))
  PRIMARY KEY (ID_PRODUTO))

-- -----------------------------------------------------
-- TABELA DE `DIM_STATUS_PRODUTO`
-- -----------------------------------------------------
/*
CREATE TABLE DIM_STATUS_PRODUTO (
  ID_STATUS_PRODUTO INT IDENTITY (1,1) NOT NULL,
  COD_STATUS_PRODUTO INT NULL,
  STATUS_PRODUTO VARCHAR(25) NULL CHECK (STATUS_PRODUTO IN ('SEM DEFEITO', 'COM DEFEITO')),
  PRIMARY KEY (ID_STATUS_PRODUTO))
  */
-- -----------------------------------------------------
-- TABELA DE `FATO_LOCACAO`
-- ----------------------------------------------------
CREATE TABLE FATO_LOCACAO (
  ID_FATO_LOCACAO INT IDENTITY (1,1) NOT NULL,
  COD_LOCACAO INT NULL,
  --DATA_LOCACAO DATE NULL,
  VALOR NUMERIC(10,2) NULL,
  QUANTIDADE INT NULL,
  ID_TEMPO INT NOT NULL,
  ID_CLIENTE INT NOT NULL,
  ID_TIPO_PAGAMENTO INT NOT NULL,
  ID_VENDEDORES INT NOT NULL,
  ID_CATEGORIA INT NOT NULL,
  ID_TRANSPORTE INT NOT NULL,
  ID_PRODUTO INT NOT NULL,
  ID_STATUS_PRODUTO INT NOT NULL)

  ALTER TABLE FATO_LOCACAO ADD CONSTRAINT PK_FATO_LOCACAO PRIMARY KEY (ID_FATO_LOCACAO)

  --CHAVE PRIMARIA COMPOSTA
  ALTER TABLE FATO_LOCACAO ADD CONSTRAINT PK_FATO_LOCACAO UNIQUE (ID_TEMPO, ID_CLIENTE, ID_TIPO_PAGAMENTO, ID_VENDEDORES, ID_CATEGORIA, ID_TRANSPORTE, ID_PRODUTO, ID_STATUS_PRODUTO)

  ALTER TABLE FATO_LOCACAO ADD CONSTRAINT FKL_DIM_TEMPO FOREIGN KEY (ID_TEMPO) REFERENCES DIM_Tempo (id_Tempo)
  ALTER TABLE FATO_LOCACAO ADD CONSTRAINT FKL_DIM_CLIENTE FOREIGN KEY (ID_CLIENTE) REFERENCES DIM_Cliente (id_Cliente)
  ALTER TABLE FATO_LOCACAO ADD CONSTRAINT FKL_DIM_TIPO_PAGAMENTO FOREIGN KEY (ID_TIPO_PAGAMENTO) REFERENCES DIM_Tipo_Pagamento (id_Tipo_Pagamento)
  ALTER TABLE FATO_LOCACAO ADD CONSTRAINT FKL_DIM_VENDEDORES FOREIGN KEY (ID_VENDEDORES) REFERENCES DIM_Vendedores (id_Vendedores)
 
  ALTER TABLE FATO_LOCACAO ADD CONSTRAINT FKL_DIM_TRANSPORTE FOREIGN KEY (ID_TRANSPORTE) REFERENCES DIM_Transporte (id_Transporte)
  ALTER TABLE FATO_LOCACAO ADD CONSTRAINT FKL_DIM_PRODUTO FOREIGN KEY (ID_PRODUTO) REFERENCES DIM_Produto (id_Produto)
 
  

-- -----------------------------------------------------
-- TABELA DE `FATO_VENDA`
-- -----------------------------------------------------


CREATE TABLE FATO_VENDA (
  ID_FATO_VENDA INT IDENTITY (1,1) NOT NULL,
  COD_VENDA INT NULL,
  --DATA_VENDA DATE NULL,
  VALOR NUMERIC(10,2) NULL,
  QUANTIDADE INT NULL,
  ID_TEMPO INT NOT NULL,
  ID_CLIENTE INT NOT NULL,
  ID_CATEGORIA INT NOT NULL,
  ID_TIPO_PAGAMENTO INT NOT NULL,
  ID_VENDEDORES INT NOT NULL,
  ID_TRANSPORTE INT NOT NULL,
  ID_PRODUTO INT NOT NULL)

  --CHAVE PRIMARIA
  ALTER TABLE FATO_VENDA ADD CONSTRAINT PK_FATO_VENDA PRIMARY KEY (ID_FATO_VENDA)

  --CHAVE PRIMARIA COMPOSTA
  ALTER TABLE FATO_VENDA ADD CONSTRAINT PK_FATO_VENDA UNIQUE(ID_TEMPO, ID_CLIENTE, ID_CATEGORIA, ID_TIPO_PAGAMENTO, ID_VENDEDORES, ID_TRANSPORTE, ID_PRODUTO)

  ALTER TABLE FATO_VENDA ADD CONSTRAINT FKV_DIM_TEMPO FOREIGN KEY (ID_TEMPO) REFERENCES DIM_Tempo (id_Tempo)
  ALTER TABLE FATO_VENDA ADD CONSTRAINT FKV_DIM_CLIENTE FOREIGN KEY (ID_CLIENTE) REFERENCES DIM_Cliente (id_Cliente)
  ALTER TABLE FATO_VENDA ADD CONSTRAINT FKV_DIM_TIPO_PAGAMENTO FOREIGN KEY (ID_TIPO_PAGAMENTO) REFERENCES DIM_Tipo_Pagamento (id_Tipo_Pagamento)
  ALTER TABLE FATO_VENDA ADD CONSTRAINT FKV_DIM_VENDEDORES FOREIGN KEY (ID_VENDEDORES) REFERENCES DIM_Vendedores (id_Vendedores)
 
  ALTER TABLE FATO_VENDA ADD CONSTRAINT FKV_DIM_TRANSPORTE FOREIGN KEY (ID_TRANSPORTE) REFERENCES DIM_Transporte (id_Transporte)
  ALTER TABLE FATO_VENDA ADD CONSTRAINT FKV_DIM_PRODUTO FOREIGN KEY (ID_PRODUTO) REFERENCES DIM_Produto (id_Produto)
  
  -------------------------------------------------------------------------------------------------------------------
 
 --------------------------------------------------------
 -- SIMULACAO DA AREA DE STAGE JA CARREGADA
 -----------------------------------------------------------
 -----------------------------------------------------------------------------------------------------
---------------------------------------------------------------
-- PROCEDIMENTO DE CARGAS DA AREA DE STAGE PARA AS DIMENS�ES
---------------------------------------------------------------

----------------------------------
--     PARA DIMENS�O CATEGORIA
----------------------------------

--ESSA PROCEDURE � SO PARA DIMENS�ES  
--TIPO 1
--TIPO 2
-------------------------------------------------------------------------
