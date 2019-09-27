USE [master]
GO

IF EXISTS(SELECT name FROM sys.databases WHERE name=N'notary_agreements')
DROP DATABASE [notary_agreements] 
GO

CREATE DATABASE [notary_agreements]
GO

USE [notary_agreements]
GO

CREATE TABLE [Sellers](
[SellerID] [int] IDENTITY(1,1) NOT NULL,
[Name] [nvarchar] (30) NOT NULL,
[Town] [nvarchar] (20) NOT NULL,
[Address] [nvarchar] (30) NOT NULL,
[PhoneNunber] [nvarchar] (20) NULL
)
GO

CREATE TABLE [Buyers](
[BuyerID] [int] IDENTITY(1,1) NOT NULL,
[Name] [nvarchar] (30) NOT NULL,
[Town] [nvarchar] (20) NOT NULL,
[Address] [nvarchar] (30) NOT NULL,
[PhoneNunber] [nvarchar] (20) NULL
)
GO

CREATE TABLE [Notaries](
[NotaryID] [int] IDENTITY(1,1) NOT NULL,
[Name] [nvarchar] (25) NOT NULL,
[Town] [nvarchar] (20) NOT NULL,
[Address] [nvarchar] (30) NOT NULL,
[PhoneNunber] [nvarchar] (20) NULL
)
GO

CREATE TABLE [Agreements](
[SellerID] [int] NOT NULL,
[BuyerID] [int] NOT NULL,
[NotaryID] [int] NOT NULL,
[Date] [date] NOT NULL,
[AgreementNumber][nvarchar] (15) NULL
)
GO