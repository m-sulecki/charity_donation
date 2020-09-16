from django.contrib.auth.models import User
from django.db import models

class Category(models.Model):
    name = models.CharField(max_length=128, default="")


fundacja = 0
organizacja_pozarzadowa = 1
zbiorka_lokalna = 2

TYPES = (
    (fundacja, "fundacja"),
    (organizacja_pozarzadowa, "organizacja pozarządowa"),
    (zbiorka_lokalna, "zbiórka lokalna"),
)

class Institution(models.Model):
    fundacja = 0
    organizacja_pozarzadowa = 1
    zbiorka_lokalna = 2

    TYPES = (
        (fundacja, "fundacja"),
        (organizacja_pozarzadowa, "organizacja pozarządowa"),
        (zbiorka_lokalna, "zbiórka lokalna"),
    )
    name = models.CharField(max_length=128, unique=True)
    description = models.TextField(max_length=256, default="")
    type = models.IntegerField(choices=TYPES, default=fundacja)
    categories = models.ManyToManyField(Category)


class Donation(models.Model):
    quantity = models.IntegerField()
    street = models.CharField(max_length=256)
    city = models.CharField(max_length=64)
    zip_code = models.CharField(max_length=6)
    categories = models.ManyToManyField(Category)
    pick_up_date = models.DateField()
    pick_up_time = models.TimeField()
    pick_up_comment = models.CharField(max_length=256, blank=True, null=True)
    institution = models.ForeignKey(Institution, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True, default=None)
    categories = models.ManyToManyField(Category)