import random
import datetime


def get_id(index):
    return str(index + 1)


def get_foreign_id(max_id):
    return str(random.randint(1,max_id))


def get_organization_names():
    name_parts = ["глав",
                "спец",
                "пром",
                "снаб",
                "мяс",
                "газ",
                "прод",
                "програм",
                "монтаж",
                "проект",
                "плюс",
                "жил",
                "лакшери",
                "бетон"]

    parts_in_name_count = random.randint(2,5)
    name = random.choices(population=name_parts,k=parts_in_name_count)
    name = set(name)
    name = "".join(name)
    name = name.title()
    return name


def get_town():
    #https://ru.wikipedia.org/wiki/Список_городов_России_с_населением_более_100_тысяч_жителей
    towns = ["Москва",
        "Санкт-Петербург",
        "Новосибирск",
        "Екатеринбург",
        "Нижний Новгород",
        "Казань",
        "Челябинск",
        "Омск",
        "Самара",
        "Ростов-на-Дону",
        "Уфа",
        "Красноярск",
        "Воронеж",
        "Пермь",
        "Волгоград",
        "Краснодар",
        "Саратов",
        "Тюмень",
        "Тольятти",
        "Ижевск"]

    town = random.choice(towns)
    return town


def get_address():
    #https://yandex.ru/company/researches/2017/streets
    streets = ["Центральная",
            "Молодёжная",
            "Школьная",
            "Советская",
            "Садовая",
            "Лесная",
            "Новая",
            "Ленина",
            "Мира",
            "Набережная"]

    street = random.choice(streets)

    house_number = str(random.randint(0,100))

    address = street + ", " + house_number
    return address


def get_phone_number():

    def get_3_digits():
        digits = str(random.randint(1000,1999))
        return digits[1:]

    phone_number = "(" + get_3_digits() + ")" + get_3_digits() + "-" + get_3_digits() + "-" + get_3_digits()
    return phone_number


def get_notary_names():

    def get_surname_end_by_sex():
        return "а" if random.random() >= 0.5 else ""

    def get_name_abbreviation():
        possible_characters = "АБВГДЕЖЗИКЛМНОПРСТУФХЦЧШЩЭЮЯ"     
        return random.choice(possible_characters) + '.'

    #https://ru.wikipedia.org/wiki/Список_общерусских_фамилий#Список_Балановской
    surnames = ["Смирнов",
                "Иванов",
                "Кузнецов",
                "Соколов",
                "Попов",
                "Лебедев",
                "Козлов",
                "Новиков",
                "Морозов",
                "Петров",
                "Волков",
                "Соловьёв",
                "Васильев",
                "Зайцев",
                "Павлов"]

    name = random.choice(surnames) + get_surname_end_by_sex()

    name+=" "
    for _ in range(2):
        name+=get_name_abbreviation()

    return name


def get_date():
    #https://stackoverflow.com/questions/553303/generate-a-random-date-between-two-other-dates

    startdate = datetime.date(2018,9,27)
    date = startdate + datetime.timedelta(random.randint(1,365))
    return str(date)


def get_agreement_number():
    def get_number_part():
        return str(random.randint(1,1000))

    agreement_number = get_number_part() 

    if random.random() >= 0.5:
        agreement_number+= "/" + get_number_part()

    return agreement_number


#-----------------------------------
def get_organizations(rows_count):
    organizations = []
    for i in range(rows_count):
        organizations.append([])
        o = organizations[i]

        o.append(get_id(i))
        o.append(get_organization_names())
        o.append(get_town())
        o.append(get_address())
        o.append(get_phone_number())

    return organizations


def get_notaries(rows_count):
    notaries = []
    for i in range(rows_count):
        notaries.append([])
        n = notaries[i]

        n.append(get_id(i))
        n.append(get_notary_names())
        n.append(get_town())
        n.append(get_address())
        n.append(get_phone_number())

    return notaries


def get_agreements(rows_count, subjects_of_agreements_counts):
    agreements = []
    for i in range(rows_count):
        agreements.append([])
        a = agreements[i]

        for j in range(3):
            """
            j=0 buyers
            j=1 sellers
            j=2 noraries
            """
            a.append(get_foreign_id(subjects_of_agreements_counts[j]))

        a.append(get_date())
        a.append(get_agreement_number())

    return agreements