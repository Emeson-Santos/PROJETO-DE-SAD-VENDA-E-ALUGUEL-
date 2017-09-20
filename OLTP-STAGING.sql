CREATE TABLE TB_Produto_AUX (
  idProduto INT NOT NULL,
  nome VARCHAR(45) NULL,
  categoria varchar(45) null, 
  status_produto varchar(25) null
  )

CREATE TABLE TB_Cliente_AUX (
   idCliente INT NOT NULL,
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
   RG INT NULL
   )

CREATE TABLE TB_Vendedores_AUX 
(
   idVendedores INT NOT NULL,
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
   CPF VARCHAR(45) NULL
   )

CREATE TABLE TB_Vendas_AUX (
   idVenda INT NOT NULL,
   cod_Venda INT NULL,
   dataVenda DATETIME NULL,
   valor DECIMAL(10,2) NULL,
   TipoPagamentocol VARCHAR(25) NULL,
   quantidade INT NULL,
   idVendedores INT NOT NULL,
   idCliente INT NOT NULL
   )

CREATE TABLE TB_Locacao_AUX (
   idLocacao INT NOT NULL,
   cod_Locacao INT NULL,
   data_Locacao DATETIME NULL,
   valorLocacao DECIMAL(10,2) NULL,
   TipoPagamentocol VARCHAR(25) NULL,
   quantidade INT NULL,
   idVendedores INT NOT NULL,
   idCliente INT NOT NULL
   )

CREATE TABLE TB_Transporte_AUX (
   idTransporte INT NULL,
   codigoTransporte INT NOT NULL,
   transporte VARCHAR(25) NULL,
   EnderecoFesta VARCHAR(45) NULL,
   idLocacao INT NOT NULL,
   idVenda INT NOT NULL
  )