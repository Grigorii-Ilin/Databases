from collections import OrderedDict

import construct

#print("Введите 1 чтобы содать файл продавцов")
#print("Введите 2 чтобы содать файл покупателей")
print("Конструктор файлов для таблиц базы данных\n")

tables=OrderedDict()
tables[1]="продавцов"
tables[2]="покупателей"
tables[3]="нотариусов"
tables[4]="договоров"

for id, name in tables.items():
    print("Введите", id, "чтобы содать файл",name,":")

table_id=int(input())

rows_count=int(input("Введите число строк: "))

if table_id in [1, 2]:
    table=construct.organizations(rows_count)
elif table_id==2:
    table=construct.notary(rows_count)
elif table_id==3:
    table=construct.agreement(rows_count)
else:
    raise "Введены некорректные данные"




