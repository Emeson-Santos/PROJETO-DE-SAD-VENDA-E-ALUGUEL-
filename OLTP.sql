-----------------------------------------------------------------------

CREATE TABLE TB_Produto (
  idProduto INT NOT NULL identity(1,1),
  nome VARCHAR(45) NULL,
  categoria varchar(45) null, 
  status_produto varchar(25) null check (status_produto in('SEM DEFEITO','COM DEFEITO')), 
    
  )
  ALTER TABLE TB_PRODUTO ADD CONSTRAINT PK_TB_PRODUTO PRIMARY KEY (idProduto);

-----------------------------------------------------------------------

CREATE TABLE TB_Cliente (
   idCliente INT NOT NULL identity(1,1),
   nome VARCHAR(45) NULL,
   dataNascimento DATETIME NULL,
   Matricula INT NULL,
   email VARCHAR(45) NULL,
   rua VARCHAR(45) NULL,
   bairro VARCHAR(45) NULL,
   cep VARCHAR(45) NULL,
   cidade VARCHAR(45) NULL,
   estado VARCHAR(45) NULL,
   sexo CHAR(1) NULL,
   CPF VARCHAR(45) NULL,
   RG INT NULL,
   )
   ALTER TABLE TB_Cliente ADD CONSTRAINT PK_TB_Cliente PRIMARY KEY (idCliente);
   --verificar se tem chave estrangeira

-----------------------------------------------------------------------

CREATE TABLE TB_Vendedores (
   idVendedores INT NOT NULL identity(1,1),
   nome VARCHAR(45) NULL,
   matricula INT NULL,
   login VARCHAR(45) NULL,
   senha VARCHAR(45) NULL,
   email VARCHAR(45) NULL,
   telefone VARCHAR(45) NULL,
   sexo CHAR(1) NULL,
   rua VARCHAR(45) NULL,
   bairro VARCHAR(45) NULL,
   cep VARCHAR(45) NULL,
   cidade VARCHAR(45) NULL,
   UF VARCHAR(2) NULL,
   RG INT NULL,
   CPF VARCHAR(45) NULL,   
   )
    ALTER TABLE TB_Vendedores ADD CONSTRAINT PK_TB_Vendedores PRIMARY KEY (idVendedores);
   --verificar se tem chave estrangeira

-----------------------------------------------------------------------

CREATE TABLE TB_Vendas (
   idVenda INT NOT NULL identity(1,1),
   cod_Venda INT NULL,
   dataVenda DATETIME NULL,
   valor DECIMAL(10,2) NULL,
   TipoPagamentocol VARCHAR(25) NULL CHECK (TipoPagamentocol IN ('Dinheiro', 'CartaoDebito')),
   quantidade INT NULL,
   idVendedores INT NOT NULL,--p/ chave estrangeira
   idCliente INT NOT NULL,--p/ chave estrangeira
   )
    ALTER TABLE TB_Vendas ADD CONSTRAINT PK_TB_Vendas PRIMARY KEY (idvenda);
	ALTER TABLE TB_Vendas ADD CONSTRAINT FK_Vendedores FOREIGN KEY (idVendedores) REFERENCES TB_Vendedores (idVendedores);
	ALTER TABLE TB_Vendas ADD CONSTRAINT FK_Cliente FOREIGN KEY (idCliente) REFERENCES TB_Cliente (idCliente);


   --verificar se tem chave estrangeira

-----------------------------------------------------------------------

CREATE TABLE TB_Locacao (
   idLocacao INT NOT NULL identity(1,1),
   cod_Locacao INT NULL,
   data_Locacao DATETIME NULL,
   valorLocacao DECIMAL(10,2) NULL,
   TipoPagamentocol VARCHAR(25) NULL CHECK (TipoPagamentocol IN ('Dinheiro', 'CartaoDebito')),
   quantidade INT NULL,
   idVendedores INT NOT NULL,--p/ chave estrangeira
   idCliente INT NOT NULL,--p/ chave estrangeira
   )
ALTER TABLE TB_LOCACAO ADD CONSTRAINT PK_TB_LOCACAO PRIMARY KEY (idLocacao);

ALTER TABLE TB_LOCACAO ADD CONSTRAINT FKL_VENDEDORES FOREIGN KEY (idVendedores) REFERENCES TB_Vendedores (idVendedores);
ALTER TABLE TB_LOCACAO ADD CONSTRAINT FKL_Cliente FOREIGN KEY (idCliente) REFERENCES TB_Cliente (idCliente);

-----------------------------------------------------------------------


-----------------------------------------------------------------------

CREATE TABLE TB_Transporte (
   idTransporte INT IDENTITY(1,1) NOT NULL ,
   codigoTransporte INT NULL,
   transporte VARCHAR(25) NULL CHECK (transporte IN ('Presencial', 'Domicilio')),
   EnderecoFesta VARCHAR(45) NULL,
   idLocacao INT NOT NULL,
   idVenda INT NOT NULL,
  )
  Alter table TB_Transporte add constraint pk_TB_Transporte PRIMARY KEY (idTransporte, idLocacao, idVenda);

  Alter table TB_Transporte add CONSTRAINT fkt_TB_Locacao FOREIGN KEY (idLocacao) REFERENCES TB_Locacao (idLocacao);
  alter table TB_Transporte add CONSTRAINT fkt_Vendas FOREIGN KEY (idVenda) REFERENCES TB_Vendas (idVenda);

-----------------------------------------------------------------------
