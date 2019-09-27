BULK INSERT [notary_agreements].[dbo].[Sellers]
FROM 'C:\MY_DOC_HP\BMSTU\2019_2\DataBase\Databases\lab1\auto_info_constructor\auto_info_constructor\1.out'
WITH(
CODEPAGE ='ACP',
DATAFILETYPE='char',
FIELDTERMINATOR=';',
ROWTERMINATOR='\n'
)
GO

BULK INSERT [notary_agreements].[dbo].[Buyers]
FROM 'C:\MY_DOC_HP\BMSTU\2019_2\DataBase\Databases\lab1\auto_info_constructor\auto_info_constructor\2.out'
WITH(
CODEPAGE ='ACP',
DATAFILETYPE='char',
FIELDTERMINATOR=';',
ROWTERMINATOR='\n'
)
GO

BULK INSERT [notary_agreements].[dbo].[Notaries]
FROM 'C:\MY_DOC_HP\BMSTU\2019_2\DataBase\Databases\lab1\auto_info_constructor\auto_info_constructor\3.out'
WITH(
CODEPAGE ='ACP',
DATAFILETYPE='char',
FIELDTERMINATOR=';',
ROWTERMINATOR='\n'
)
GO

BULK INSERT [notary_agreements].[dbo].[Agreements]
FROM 'C:\MY_DOC_HP\BMSTU\2019_2\DataBase\Databases\lab1\auto_info_constructor\auto_info_constructor\4.out'
WITH(
CODEPAGE ='ACP',
DATAFILETYPE='char',
FIELDTERMINATOR=';',
ROWTERMINATOR='\n'
)
GO