 python manage.py shell
 from karitato.models import *
 from datetime import datetime

category1 = Category.objects.create(name='ubrania')
category2 = Category.objects.create(name='sprzęt AGD')
category3 = Category.objects.create(name='meble')
category4 = Category.objects.create(name='książki')
category5 = Category.objects.create(name='przybory szkolne')
category6 = Category.objects.create(name='zabawki')
category7 = Category.objects.create(name='ciepłe koce')
category8 = Category.objects.create(name='narzędzia')
category9 = Category.objects.create(name='różne')

institution1 = Institution.objects.create(name='Samotne matki', description='Cel i misja: Pomaganie samotnym matkom w trudnej sytuacji materialnej.',type=Institution.FUNDACJA)
institution2 = Institution.objects.create(name='Trudne dzieci', description='Cel i misja: Wyprowadzanie na prostą trudnej młodzieży',type=Institution.ORGANIZACJA_POZARZADOWA)
institution3 = Institution.objects.create(name='Drugie życie', description='Cel i misja: Znajdowanie nowego właściciela zapomnianym przedmiotom',type=Institution.ZBIORKA_LOKALNA)
institution4 = Institution.objects.create(name='Defraudacja', description='Cel i misja: Pomoc w prowadzeniu karuzel VAT-owskich.',type=Institution.ZBIORKA_LOKALNA)
institution5 = Institution.objects.create(name='Bez domu', description='Cel i misja: Pomoc dla osób nie posiadających miejsca zamieszkania',type=Institution.FUNDACJA)
institution6 = Institution.objects.create(name='Dbam o Was', description='Cel i misja: Pomoc dzieciom z ubogich rodzin.',type=Institution.ORGANIZACJA_POZARZADOWA)
institution7 = Institution.objects.create(name='Dobra waga', description='Cel i misja: Pomoc osobom otyłym.',type=Institution.ZBIORKA_LOKALNA)
institution8 = Institution.objects.create(name='Kundel bury', description='Cel i misja: Pomoc samotnym psiakom.',type=Institution.FUNDACJA)
institution9 = Institution.objects.create(name='Po przerwie', description='Cel i misja: Pomoc emerytowanym sportowcom.',type=Institution.ZBIORKA_LOKALNA)
institution10 = Institution.objects.create(name='Nastoletnie matki', description='Cel i misja: Pomoc nastoletnim matkom.',type=Institution.ORGANIZACJA_POZARZADOWA)
institution11 = Institution.objects.create(name='Nie bij', description='Cel i misja: Pomoc ofiarom przemocy domowej.',type=Institution.ZBIORKA_LOKALNA)
institution12 = Institution.objects.create(name='Polska Akcja Humanitarna', description='Cel i misja: Pomoc mieszkańcom ubogich krajów.',type=Institution.ORGANIZACJA_POZARZADOWA)
institution13 = Institution.objects.create(name='Podziel się posiłkiem', description='Cel i misja: Pomoc niedożywionym dzieciom.',type=Institution.ZBIORKA_LOKALNA)
institution14 = Institution.objects.create(name='Wielka filharmonia', description='Cel i misja: Pomoc uzdolnionym muzycznie.',type=Institution.ORGANIZACJA_POZARZADOWA)
institution15 = Institution.objects.create(name='Chwila relaksu', description='Cel i misja: Pomoc spracowanym.',type=Institution.ZBIORKA_LOKALNA)
institution16 = Institution.objects.create(name='Detox', description='Cel i misja: Pomoc narkomanom.',type=Institution.FUNDACJA)
institution17 = Institution.objects.create(name='Daj bucha', description='Cel i misja: Pomoc palącym mairhuaninen.',type=Institution.ZBIORKA_LOKALNA)
institution18 = Institution.objects.create(name='Weź się tato', description='Cel i misja: Pomoc samotnym ojcom.',type=Institution.ZBIORKA_LOKALNA)
institution19 = Institution.objects.create(name='Daj gryza', description='Cel i misja: Pomoc prześladowanym w szkole.',type=Institution.ORGANIZACJA_POZARZADOWA)
institution20 = Institution.objects.create(name='Pozdrowienia do więzienia', description='Cel i misja: Pomoc dobrym chłopakom, którzy oglądają świat zza krat.',type=Institution.ZBIORKA_LOKALNA)
institution21 = Institution.objects.create(name='Pod celom', description='Cel i misja: Pomoc drobnym przestępcom odbywającym karę.',type=Institution.FUNDACJA)
institution22 = Institution.objects.create(name='Daj żyć', description='Cel i misja: Pomoc umierającym.',type=Institution.ORGANIZACJA_POZARZADOWA)
institution23 = Institution.objects.create(name='Gdzie ta praca?', description='Cel i misja: Pomoc szukającym pracy.',type=Institution.ZBIORKA_LOKALNA)
institution24 = Institution.objects.create(name='Jak daleko?', description='Cel i misja: Pomoc wypędzonym.',type=Institution.FUNDACJA)

user1 = MyUser.objects.create(first_name='Janusz', last_name='Kulczyk', email='janusz-kulczyk@company.com', password='euro&dolary')
user2 = MyUser.objects.create(first_name='Piotr', last_name='Krok', email='piotr-krok@company.com', password='zygmunt&solorz')
user3 = MyUser.objects.create(first_name='Wojciech', last_name='Fortuna', email='wojciech-fortuna@company.com', password='sapporo1972')
user4 = MyUser.objects.create(first_name='Tomasz', last_name='Borowiec', email='tomasz-borowiec@company.com', password='losangeles1932')
user5 = MyUser.objects.create(first_name='Malwina', last_name='Liszewska', email='malwina-liszewska@company.com', password='seoul1988')
user6 = MyUser.objects.create(first_name='Krzysztof', last_name='Rozwadowski', email='krzysztof-rozwadowski@company.com', password='barcelona1922')
user7 = MyUser.objects.create(first_name='Marlena', last_name='Zawarowski', email='marlena-zawarowski@company.com', password='helsinki1912')

donation1 = Donation.objects.create(user=user2, institution=institution2,quantity=7, address='ul.Koryńska 72', phone_number=123456789, city='Rzeszów', zip_code='25-485', pick_up_date=datetime.now(), pick_up_time=datetime.now(), pick_up_comment='Odbiór osobisty.')
donation2 = Donation.objects.create(user=user6, institution=institution1,quantity=3, address='ul. Jońska 41', phone_number=123456789, city='Gdynia', zip_code='36-758', pick_up_date=datetime.now(), pick_up_time=datetime.now(), pick_up_comment='Nie ma pośpiechu.')
donation3 = Donation.objects.create(user=user1, institution=institution3,quantity=12, address='ul.Koryńska 72', phone_number=123456789, city='Wałbrzych', zip_code='15-785', pick_up_date=datetime.now(), pick_up_time=datetime.now(), pick_up_comment='Nie dzwonić dzwonkiem.')
donation4 = Donation.objects.create(user=user3, institution=institution1,quantity=9, address='ul. Franciszkańska 82', phone_number=123456789, city='Poznań', zip_code='02-785', pick_up_date=datetime.now(), pick_up_time=datetime.now(), pick_up_comment='Ostrożnie, delikatna paczka.')
donation5 = Donation.objects.create(user=user2, institution=institution2,quantity=26, address='ul. Olimpijska 96', phone_number=123456789, city='Kraków', zip_code='70-005', pick_up_date=datetime.now(), pick_up_time=datetime.now(), pick_up_comment='Przyjechać przy zgaszonym świetle.')
donation6 = Donation.objects.create(user=user4, institution=institution15,quantity=4, address='ul. Zimowa 34', phone_number=123456789, city='Bydgoszcz', zip_code='27-822', pick_up_date=datetime.now(), pick_up_time=datetime.now(), pick_up_comment='Przywieźć coś do jedzenia.')
donation7 = Donation.objects.create(user=user6, institution=institution12,quantity=21, address='ul. Opoczyńska 8', phone_number=123456789, city='Toruń', zip_code='60-115', pick_up_date=datetime.now(), pick_up_time=datetime.now(), pick_up_comment='Sprzedać to z zyskiem.')
donation8 = Donation.objects.create(user=user2, institution=institution8,quantity=8, address='ul. Fałata 87', phone_number=123456789, city='Bolesławiec', zip_code='88-057', pick_up_date=datetime.now(), pick_up_time=datetime.now(), pick_up_comment='Tylko do użytku zewnętrznego.')
donation9 = Donation.objects.create(user=user7, institution=institution9,quantity=27, address='ul. Janikowska 91', phone_number=123456789, city='Suwałki', zip_code='03-746', pick_up_date=datetime.now(), pick_up_time=datetime.now(), pick_up_comment='Nie rozpakowywać przed południem.')
donation10 = Donation.objects.create(user=user5, institution=institution13,quantity=12, address='ul. Trębicka 28', phone_number=123456789, city='Wrocław', zip_code='45-753', pick_up_date=datetime.now(), pick_up_time=datetime.now(), pick_up_comment='Schować do piwnicy.')

-- donation = Donation.objects.get(pk=1)
-- category = Category.objects.get(name='różne')
-- donation.categories.add(category)
--
dc1 = Donation.objects.get(pk=1).categories.add(Category.objects.get(pk=1))
dc2 = Donation.objects.get(pk=1).categories.add(Category.objects.get(pk=5))
dc3 = Donation.objects.get(pk=2).categories.add(Category.objects.get(pk=7))
dc4 = Donation.objects.get(pk=2).categories.add(Category.objects.get(pk=9))
dc5 = Donation.objects.get(pk=2).categories.add(Category.objects.get(pk=3))
dc6 = Donation.objects.get(pk=3).categories.add(Category.objects.get(pk=4))
dc7 = Donation.objects.get(pk=3).categories.add(Category.objects.get(pk=6))
dc8 = Donation.objects.get(pk=4).categories.add(Category.objects.get(pk=8))
dc9 = Donation.objects.get(pk=5).categories.add(Category.objects.get(pk=9))
dc10 = Donation.objects.get(pk=6).categories.add(Category.objects.get(pk=7))
dc11 = Donation.objects.get(pk=7).categories.add(Category.objects.get(pk=2))
dc12 = Donation.objects.get(pk=7).categories.add(Category.objects.get(pk=4))
dc13 = Donation.objects.get(pk=8).categories.add(Category.objects.get(pk=3))
dc14 = Donation.objects.get(pk=9).categories.add(Category.objects.get(pk=2))
dc15 = Donation.objects.get(pk=9).categories.add(Category.objects.get(pk=1))
dc16 = Donation.objects.get(pk=9).categories.add(Category.objects.get(pk=9))
dc17 = Donation.objects.get(pk=10).categories.add(Category.objects.get(pk=3))
dc18 = Donation.objects.get(pk=10).categories.add(Category.objects.get(pk=7))


ic1 = Institution.objects.get(pk=5).categories.add(Category.objects.get(pk=1))
ic2 = Institution.objects.get(pk=5).categories.add(Category.objects.get(pk=5))
ic3 = Institution.objects.get(pk=3).categories.add(Category.objects.get(pk=7))
ic4 = Institution.objects.get(pk=3).categories.add(Category.objects.get(pk=9))
ic5 = Institution.objects.get(pk=7).categories.add(Category.objects.get(pk=3))
ic6 = Institution.objects.get(pk=7).categories.add(Category.objects.get(pk=4))
ic7 = Institution.objects.get(pk=7).categories.add(Category.objects.get(pk=6))
ic8 = Institution.objects.get(pk=1).categories.add(Category.objects.get(pk=8))
ic9 = Institution.objects.get(pk=2).categories.add(Category.objects.get(pk=9))
ic10 = Institution.objects.get(pk=4).categories.add(Category.objects.get(pk=7))
ic11 = Institution.objects.get(pk=4).categories.add(Category.objects.get(pk=9))
ic12 = Institution.objects.get(pk=4).categories.add(Category.objects.get(pk=8))
ic13 = Institution.objects.get(pk=6).categories.add(Category.objects.get(pk=6))
ic14 = Institution.objects.get(pk=8).categories.add(Category.objects.get(pk=4))
ic15 = Institution.objects.get(pk=8).categories.add(Category.objects.get(pk=2))
ic16 = Institution.objects.get(pk=8).categories.add(Category.objects.get(pk=3))
ic17 = Institution.objects.get(pk=9).categories.add(Category.objects.get(pk=1))
ic18 = Institution.objects.get(pk=9).categories.add(Category.objects.get(pk=8))
ic19 = Institution.objects.get(pk=10).categories.add(Category.objects.get(pk=1))
ic20 = Institution.objects.get(pk=10).categories.add(Category.objects.get(pk=3))
ic21 = Institution.objects.get(pk=10).categories.add(Category.objects.get(pk=6))
ic22 = Institution.objects.get(pk=11).categories.add(Category.objects.get(pk=2))
ic23 = Institution.objects.get(pk=11).categories.add(Category.objects.get(pk=8))
ic24 = Institution.objects.get(pk=12).categories.add(Category.objects.get(pk=9))
ic25 = Institution.objects.get(pk=13).categories.add(Category.objects.get(pk=5))
ic26 = Institution.objects.get(pk=13).categories.add(Category.objects.get(pk=6))
ic27 = Institution.objects.get(pk=13).categories.add(Category.objects.get(pk=8))
ic28 = Institution.objects.get(pk=13).categories.add(Category.objects.get(pk=9))
ic29 = Institution.objects.get(pk=14).categories.add(Category.objects.get(pk=4))
ic30 = Institution.objects.get(pk=14).categories.add(Category.objects.get(pk=6))
ic31 = Institution.objects.get(pk=14).categories.add(Category.objects.get(pk=7))
ic32 = Institution.objects.get(pk=15).categories.add(Category.objects.get(pk=2))
ic33 = Institution.objects.get(pk=15).categories.add(Category.objects.get(pk=3))
ic34 = Institution.objects.get(pk=16).categories.add(Category.objects.get(pk=5))
ic35 = Institution.objects.get(pk=16).categories.add(Category.objects.get(pk=6))
ic36 = Institution.objects.get(pk=16).categories.add(Category.objects.get(pk=8))
ic37 = Institution.objects.get(pk=17).categories.add(Category.objects.get(pk=9))
ic38 = Institution.objects.get(pk=17).categories.add(Category.objects.get(pk=1))
ic39 = Institution.objects.get(pk=18).categories.add(Category.objects.get(pk=2))
ic40 = Institution.objects.get(pk=18).categories.add(Category.objects.get(pk=5))
ic41 = Institution.objects.get(pk=18).categories.add(Category.objects.get(pk=7))
ic41 = Institution.objects.get(pk=19).categories.add(Category.objects.get(pk=2))
ic41 = Institution.objects.get(pk=19).categories.add(Category.objects.get(pk=5))
ic41 = Institution.objects.get(pk=20).categories.add(Category.objects.get(pk=1))
ic41 = Institution.objects.get(pk=20).categories.add(Category.objects.get(pk=8))
ic41 = Institution.objects.get(pk=21).categories.add(Category.objects.get(pk=3))
ic41 = Institution.objects.get(pk=21).categories.add(Category.objects.get(pk=6))
ic41 = Institution.objects.get(pk=21).categories.add(Category.objects.get(pk=9))
ic41 = Institution.objects.get(pk=21).categories.add(Category.objects.get(pk=4))
ic41 = Institution.objects.get(pk=22).categories.add(Category.objects.get(pk=5))
ic41 = Institution.objects.get(pk=22).categories.add(Category.objects.get(pk=7))
ic41 = Institution.objects.get(pk=22).categories.add(Category.objects.get(pk=1))
ic41 = Institution.objects.get(pk=22).categories.add(Category.objects.get(pk=3))
ic41 = Institution.objects.get(pk=23).categories.add(Category.objects.get(pk=8))
ic41 = Institution.objects.get(pk=23).categories.add(Category.objects.get(pk=1))
ic41 = Institution.objects.get(pk=24).categories.add(Category.objects.get(pk=2))
ic41 = Institution.objects.get(pk=24).categories.add(Category.objects.get(pk=8))
ic41 = Institution.objects.get(pk=24).categories.add(Category.objects.get(pk=9))