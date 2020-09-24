from django.contrib.auth.base_user import AbstractBaseUser, BaseUserManager
from django.contrib.auth.models import User, AbstractUser
from django.db import models


class UserManager(BaseUserManager):
    def create_user(self, email, password=None):
        """
        Creates and saves a User with the given email and password.
        """
        if not email:
            raise ValueError('Users must have an email address')

        user = self.model(
            email=self.normalize_email(email),
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_staffuser(self, email, password):
        """
        Creates and saves a staff user with the given email and password.
        """
        user = self.create_user(
            email,
            password=password,
        )
        user.staff = True
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password):
        """
        Creates and saves a superuser with the given email and password.
        """
        user = self.create_user(
            email,
            password=password,
        )
        user.staff = True
        user.admin = True
        user.save(using=self._db)
        return user


class MyUser(AbstractBaseUser):
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.EmailField(max_length=255, unique=True)

    active = models.BooleanField(default=True)
    staff = models.BooleanField(default=False)  # a admin user; non super-user
    admin = models.BooleanField(default=False)  # a superuser

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []
    objects = UserManager()

    def __str__(self):
        return f'{self.first_name} {self.last_name}'

    def get_full_name(self):
        # The user is identified by their email address
        return self.email

    def get_short_name(self):
        # The user is identified by their email address
        return self.email

    def has_perm(self, perm, obj=None):
        "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        return True

    def has_module_perms(self, app_label):
        "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return True

    @property
    def is_staff(self):
        "Is the user a member of staff?"
        return self.staff

    @property
    def is_admin(self):
        "Is the user a admin member?"
        return self.admin

    @property
    def is_active(self):
        "Is the user active?"
        return self.active


class Category(models.Model):
    name = models.CharField(max_length=128, default="")

    def __str__(self):
        return self.name


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

    def __str__(self):
        return self.name


class Donation(models.Model):
    quantity = models.IntegerField()
    categories = models.ManyToManyField(Category)
    institution = models.ForeignKey(Institution, on_delete=models.CASCADE)
    address = models.CharField(max_length=255, null=False)
    phone_number = models.IntegerField(null=False)
    city = models.CharField(max_length=64)
    zip_code = models.CharField(max_length=6)
    pick_up_date = models.DateField()
    pick_up_time = models.TimeField()
    pick_up_comment = models.CharField(max_length=256, blank=True, null=True)
    user = models.ForeignKey(MyUser, on_delete=models.CASCADE, null=True, default=None)

    def __str__(self):
        return f'{self.user.first_name} {self.user.last_name}({self.city}) Donation'
