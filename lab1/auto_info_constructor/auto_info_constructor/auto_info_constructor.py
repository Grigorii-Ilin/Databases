from collections import OrderedDict
from pprint import pprint
import csv

import construct


def save_to_csv():
    filename=str(table_id)+".out"

    with open(filename, 'w') as f:
        writer = csv.writer(f, delimiter=';', lineterminator='\n')
        writer.writerows(table) 
        
    print("\nТаблица сохранена в файл", filename)


print("Конструктор файлов для таблиц базы данных\n")

tables = OrderedDict()
tables[1] = "продавцов"
tables[2] = "покупателей"
tables[3] = "нотариусов"
tables[4] = "договоров"

while True:

    for key, value in tables.items():
        print("Введите", key, "чтобы содать файл",value,":")

    table_id = int(input())

    rows_count = int(input("Введите число строк: "))

    if table_id in [1, 2]:
        table = construct.get_organizations(rows_count)

    elif table_id == 3:
        table = construct.get_notaries(rows_count)

    elif table_id == 4:
        subjects_of_agreements_counts = []
        for i in range(1,4):
            print("Введите количество возможных", tables[i], "для договоров:")
            subjects_of_agreements_counts.append(int(input()))

        table = construct.get_agreements(rows_count, subjects_of_agreements_counts)

    else:
        raise ValueError("Введены некорректные данные")

    pprint(table[:10])
    save_to_csv()
    print("--------------------------")

