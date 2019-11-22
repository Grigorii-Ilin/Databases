
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

print("Выбрать участников договоров, которые зарегистрированы в Тольятти")
cursor.execute("""
SELECT s.Name AS N'Продавец'
FROM [notary_agreements].[dbo].[Sellers] s JOIN
    (SELECT Name AS N'Покупатель'
    FROM [notary_agreements].[dbo].[Buyers]
    --WHERE Town=N'Тольятти'
    ) AS b ON s.Town=b.Town
--WHERE s.Town=N'Тольятти'
""")
show_rows(cursor)


