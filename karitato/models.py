from django.contrib.auth.base_user import AbstractBaseUser
from django.contrib.auth.models import User, AbstractUser
from django.db import models

from django.utils.translation import gettext_lazy as _

# class User(AbstractUser):
#     """User model."""
#
#     username = None
#     email = models.EmailField(_('email address'), unique=True)
#
#     USERNAME_FIELD = 'email'
#     REQUIRED_FIELDS = []

class MyUser(AbstractBaseUser):
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.EmailField(max_length=255, unique=True)
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

class Category(models.Model):
    name = models.CharField(max_length=128, default="")


class Institution(models.Model):
    FUNDACJA = 0
    ORGANIZACJA_POZARZADOWA = 1
    ZBIORKA_LOKALNA = 2

    TYPES = (
        (FUNDACJA, "fundacja"),
        (ORGANIZACJA_POZARZADOWA, "organizacja pozarządowa"),
        (ZBIORKA_LOKALNA, "zbiórka lokalna"),
    )
    name = models.CharField(max_length=128, unique=True)
    description = models.TextField(max_length=256, default="")
    type = models.IntegerField(choices=TYPES, default=FUNDACJA)
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
    user = models.ForeignKey(MyUser, on_delete=models.CASCADE, null=True, default=None)
    categories = models.ManyToManyField(Category)

