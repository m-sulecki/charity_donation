from django.urls import path
from .views import LandingPage, LoginView, RegisterView, AddDonation, AddDonationConfiramtion, LogoutView

urlpatterns = [
    path('', LandingPage.as_view(), name='index'),
    path('login/', LoginView.as_view(), name='login'),
    path('logout/', LogoutView.as_view(), name='logout'),
    path('register/', RegisterView.as_view(), name='register'),
    path('form/', AddDonation.as_view(), name='form'),
    path('form/confirmation/', AddDonationConfiramtion.as_view(), name='form-pass')
]