CREATE DATABASE DataDica;
GO

USE DATADICA;
GO

CREATE TABLE BAIRROS(
  CODIGO INT NOT NULL IDENTITY( 1 , 1 ),
  DESCRICAO VARCHAR( 50 ) NOT NULL,
  STATUS INT NOT NULL
);
GO