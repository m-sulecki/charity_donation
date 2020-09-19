python manage.py shell
from karitato.models import *
from datetime import datetime

category1 = Category.objects.create(name='Niepotrzebne ubrania')
category2 = Category.objects.create(name='Elektronika')
category3 = Category.objects.create(name='Rzeczy codziennego użytku')
category4 = Category.objects.create(name='Książki')
category5 = Category.objects.create(name='Różne')

institution1 = Institution.objects.create(name='Samotne matki', description='Pomaganie samotnym matkom w trudnej sytuacji materialnej.',type='2')
institution2 = Institution.objects.create(name='Trudne dzieci', description='Wyprowadzanie na prostą trudnej młodzieży',type='1')
institution3 = Institution.objects.create(name='Drugie życie', description='Znajdowanie nowego właściciela zapomnianym przedmiotom',type='0')
institution4 = Institution.objects.create(name='Defraudacja', description='Pomoc w prowadzeniu karuzel VAT-owskich.',type='1')

user1 = MyUser.objects.create(first_name='Janusz', last_name='Kulczyk', email='janusz-kulczyk@company.com', password='euro&dolary')
user2 = MyUser.objects.create(first_name='Piotr', last_name='Krok', email='piotr-krok@company.com', password='zygmunt&solorz')
user3 = MyUser.objects.create(first_name='Wojciech', last_name='Fortuna', email='wojciech-fortuna@company.com', password='sapporo1972')

donation1 = Donation.objects.create(user=user2, institution=institution2,quantity=7,street='ul.Koryńska 72', city='Rzeszów', zip_code='25-485', pick_up_date=datetime.now(), pick_up_time=datetime.now(), pick_up_comment='Odbiór osobisty.')
donation2 = Donation.objects.create(user=user3, institution=institution1,quantity=3,street='ul. Jońska 41', city='Gdynia', zip_code='36-758', pick_up_date=datetime.now(), pick_up_time=datetime.now(), pick_up_comment='Nie ma pośpiechu.')
donation3 = Donation.objects.create(user=user1, institution=institution3,quantity=12,street='ul.Koryńska 72', city='Wałbrzych', zip_code='15-785', pick_up_date=datetime.now(), pick_up_time=datetime.now(), pick_up_comment='Nie dzwonić dzwonkiem.')
donation4 = Donation.objects.create(user=user3, institution=institution1,quantity=9,street='ul. Franciszkańska 82', city='Poznań', zip_code='02-785', pick_up_date=datetime.now(), pick_up_time=datetime.now(), pick_up_comment='Ostrożnie, delikatna paczka.')
donation5 = Donation.objects.create(user=user2, institution=institution2,quantity=25,street='ul. Rzymska 28', city='Toruń', zip_code='87-895', pick_up_date=datetime.now(), pick_up_time=datetime.now(), pick_up_comment='Przechowywać w chłodnym miejscu.')
