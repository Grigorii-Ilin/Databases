
#https://docs.microsoft.com/ru-ru/sql/connect/python/pyodbc/python-sql-driver-pyodbc?view=sql-server-2017
import pyodbc 
server = r'DESKTOP-RKP916D\SQLEXPRESS'
database = 'notary_agreements' 
cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';Trusted_Connection=Yes;')
cursor = cnxn.cursor()

def show_rows(cursor):
    row = cursor.fetchone()
    while row:
        print (row)
        row = cursor.fetchone()
    print()

print("Информация о MS SQL Server:")
cursor.execute("SELECT @@version;")
show_rows(cursor)

print("Выбрать 20 первых продавцов")
cursor.execute("""
    SELECT TOP 20 *
    FROM [notary_agreements].[dbo].[Sellers] 
    """)
show_rows(cursor)

print("Выбрать всех покурателей с названием ""Монтажглав"" либо ""Газспец"" ")
cursor.execute("""
    SELECT *
    FROM [notary_agreements].[dbo].[Buyers]
    WHERE Name IN (N'Монтажглав', N'Газспец') 
    """)
show_rows(cursor)

print("Выбрать продавцов, которые зарегистрированы в Тольятти")
cursor.execute("""
    SELECT s.Name AS N'Продавец'
    FROM [notary_agreements].[dbo].[Sellers] s 
    WHERE s.Town=N'Тольятти'
    """)
show_rows(cursor)

cnxn.commit()

print("Заменить фамилии нотариусов с Иванов(а) на Иванов-Сергеев")
cursor.execute("""
    UPDATE [notary_agreements].[dbo].[Notaries]
    SET Name=N'Иванов-Сергеев'
    WHERE Name LIKE '%Иванов%'
    """)
print("Изменено строк: ", cursor.rowcount, "\n")
cnxn.commit()

print("Вставить новый договор")
cursor.execute("""
    INSERT [notary_agreements].[dbo].[Agreements] ([SellerID], [BuyerID] ,[NotaryID] ,[Date] ,[AgreementNumber])
    VALUES( 567, 345, 941, '2019-11-23', '34/679')
    """)
print("Вставлено строк: ", cursor.rowcount, "\n")
cnxn.commit()

print("Удалить 10% договоров без номеров")
cursor.execute("""
    DELETE TOP (10) PERCENT
    FROM [notary_agreements].[dbo].[Agreements]
    WHERE [AgreementNumber] IS NULL
    """)
print("Удалено строк: ", cursor.rowcount, "\n")
cnxn.commit()






