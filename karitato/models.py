from django.db import models

class Category(models.Model):
    name = models.CharField(max_length=128, default="")

TYPES = (
    (0, "fundacja"),
    (1, "organizacja pozarządowa"),
    (2, "zbiórka lokalna"),
)

class Institution(models.Model):
    name = models.CharField(max_length=128, default="")
    description = models.TextField(default="")
    type = models.IntegerField(choices=TYPES, default=0)
    categories = models.ManyToManyField(Category, )

