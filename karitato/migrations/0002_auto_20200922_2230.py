# Generated by Django 3.1.1 on 2020-09-22 22:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('karitato', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='myuser',
            name='is_staff',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='myuser',
            name='is_superuser',
            field=models.BooleanField(default=False),
        ),
    ]