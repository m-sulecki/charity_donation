from django.contrib.auth.forms import UserCreationForm
from .models import MyUser
from django import forms


class UserRegisterForm(UserCreationForm):
    first_name = forms.CharField(max_length=64, widget=forms.TextInput(attrs={'placeholder': 'Imię'}))
    last_name = forms.CharField(max_length=64, widget=forms.TextInput(attrs={'placeholder': 'Nazwisko'}))
    email = forms.EmailField(max_length=200, widget=forms.TextInput(attrs={'placeholder': 'e-mail'}))
    password1 = forms.CharField(widget=forms.PasswordInput(attrs={'placeholder': 'Hasło'}))
    password2 = forms.CharField(widget=forms.PasswordInput(attrs={'placeholder': 'Powtórz hasło'}))

    class Meta:
        model = MyUser
        fields = ('first_name', 'last_name', 'email', 'password1', 'password2',)


class LoginForm(forms.Form):
    login = forms.CharField(max_length=100, widget=forms.TextInput(attrs={'placeholder': 'e-mail'}))
    password = forms.CharField(max_length=100, widget=forms.PasswordInput(attrs={'placeholder': 'hasło'}))