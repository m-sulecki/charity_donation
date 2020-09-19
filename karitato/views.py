from django.db.models import Sum
from django.shortcuts import render
from django.views.generic import View

from karitato.models import Donation, Institution


class LandingPage(View):
    def get(self, request):
        organizations = Donation.objects.values('institution').distinct().count()
        bags = Donation.objects.all().aggregate(Sum('quantity'))['quantity__sum']
        institutions = Institution.objects.all()
        ctx = {
            'organizations': organizations,
            'bags': bags,
            'institutions': institutions,
        }
        return render(request, 'index.html', ctx)


class AddDonation(View):
    def get(self, request):
        return render(request, 'form.html')


class AddDonationConfiramtion(View):
    def get(self, request):
        return render(request, 'form-confirmation.html')


class LoginView(View):
    def get(self, request):
        return render(request, 'login.html')


class RegisterView(View):
    def get(self, request):
        return render(request, 'register.html')
