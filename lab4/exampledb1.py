import pandas as pd
import pyodbc 
# Some other example server values are
# server = 'localhost\sqlexpress' # for a named instance
# server = 'myserver,port' # to specify an alternate port
server = r'DESKTOP-RKP916D\SQLEXPRESS'#'tcp:myserver.database.windows.net' 
database = 'Northwind' #'master'#'Northwind'#'mydb' 
#username = 'FS_Adm'#r'DESKTOP-RKP916D\HP'#'myusername' 
#password = input() #'mypassword' 
#cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
#cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+'Trusted_Connection=Yes;')
cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';Trusted_Connection=Yes;')
cursor = cnxn.cursor()

#Sample select query
cursor.execute("SELECT @@version;")
row = cursor.fetchone()
while row:
    print (row[0])
    row = cursor.fetchone()

sql_query="""
SELECT *
FROM [Northwind].[dbo].[Products] 
"""

df=pd.read_sql(sql_query, cnxn)
print(df)
