USE master
GO

ALTER TABLE [notary_agreements].[dbo].[Sellers]
ADD
CONSTRAINT PK_SellerID PRIMARY KEY(SellerID),
CONSTRAINT CK_PhoneNunber CHECK(PhoneNunber LIKE '([0-9][0-9][0-9])[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]')

ALTER TABLE [notary_agreements].[dbo].[Buyers]
ADD
CONSTRAINT PK_BuyerID PRIMARY KEY(BuyerID),
CONSTRAINT[CK_BuyerID] CHECK(BuyerID BETWEEN 1 AND 10000)

ALTER TABLE [notary_agreements].[dbo].[Notaries]
ADD
CONSTRAINT PK_NotaryID PRIMARY KEY(NotaryID)

ALTER TABLE [notary_agreements].[dbo].[Agreements]
ADD
CONSTRAINT PK_AgreementID PRIMARY KEY(AgreementID),
CONSTRAINT FK_SellerID FOREIGN KEY(SellerID) REFERENCES Sellers (SellerID),
CONSTRAINT FK_BuyerID FOREIGN KEY(BuyerID) REFERENCES Buyers (BuyerID),
CONSTRAINT FK_NotaryID FOREIGN KEY(NotaryID) REFERENCES Notaries (NotaryID)


GO

--CREATE DEFAULT DEF_Unkn AS 'б/н';  -- Создание выражения по умолчанию
--GO  -- Конец пакета

--EXEC sp_bindefault 'DEF_Unkn', 'notary_agreements.dbo.Agreements.AgreementNumber'; 
--GO

--CREATE RULE RUL_GreaterOrEqualZero AS @value >= 0;  -- Создать правило
--GO  -- Конец пакета


--EXEC sp_bindrule 'RUL_GreaterOrEqualZero', 'notary_agreements.dbo.Agreements.SellerID';  -- Связать поле с правилом
--GO

