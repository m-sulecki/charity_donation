from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.mixins import LoginRequiredMixin
from django.db.models import Sum
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse_lazy
from django.views.generic import View, FormView
from django.core.paginator import Paginator

from karitato.forms import UserRegisterForm, LoginForm, DonationForm
from karitato.models import Donation, Institution, Category, MyUser


class LandingPage(View):
    def get(self, request):
        organizations = Donation.objects.values('institution').distinct().count()
        bags = Donation.objects.all().aggregate(Sum('quantity'))['quantity__sum']
        institutions = Institution.objects.all()

        foundations = Institution.objects.all().filter(type=Institution.FUNDACJA)  # contact_list
        non_govs = Institution.objects.all().filter(type=Institution.ORGANIZACJA_POZARZADOWA)
        locals = Institution.objects.all().filter(type=Institution.ZBIORKA_LOKALNA)

        # foundations_paginator = Paginator(foundations, 3)
        # non_govs_paginator = Paginator(non_govs, 3)
        # locals_paginator = Paginator(locals, 3)

        # page_foundations_numbers = request.GET.get('page')
        # page_non_govs_number = request.GET.get('page')
        # page_locals_number = request.GET.get('page')

        # page_foundations_obj = foundations_paginator.get_page(page_foundations_numbers)
        # page_non_gov_obj = non_govs_paginator.get_page(page_non_govs_number)
        # page_locals_obj = locals_paginator.get_page(page_locals_number)

        ctx = {
            'organizations': organizations,
            'bags': bags,
            'institutions': institutions,
            'foundations': foundations,
            'non_govs': non_govs,
            'locals': locals,
            # 'page_foundations_obj': page_foundations_obj,
            # 'page_non_gov_obj': page_non_gov_obj,
            # 'page_locals_obj': page_locals_obj,
        }
        return render(request, 'index.html', ctx)

    login_url = reverse_lazy("login")
    template_name = 'form.html'


class AddDonation(LoginRequiredMixin, View):
    login_url = reverse_lazy('login')

    def get(self, request):
        form = DonationForm()
        categories = Category.objects.all()
        institutions = Institution.objects.all()
        ctx = {'categories': categories,
               'institutions': institutions,
               'form': form, }
        return render(request, 'form.html', ctx)

    def post(self, request):
        form = DonationForm(request.POST)

        if form.is_valid():
            quantity = request.POST.get('bags')
            categories = request.POST.getlist('categories')
            organization = request.POST.get('organization')
            institution = Institution.objects.get(id=organization)
            address = request.POST.get('address')
            phone_number = request.POST.get('phone_number')
            city = request.POST.get('city')
            zip_code = request.POST.get('zip_code')
            pick_up_date = request.POST.get("data")
            pick_up_time = request.POST.get("time")
            pick_up_comment = request.POST.get("more_info")
            user = get_object_or_404(MyUser, pk=request.user.id)

            new_donation = Donation.objects.create(
                quantity=quantity,
                institution=institution,
                address=address,
                phone_number=phone_number,
                city=city,
                zip_code=zip_code,
                pick_up_date=pick_up_date,
                pick_up_time=pick_up_time,
                pick_up_comment=pick_up_comment,
                user=user,
            )
            new_donation.save()
            for i in range(len(categories)):
                new_categories = Category.objects.get(id=categories[i])
                new_donation.categories.add(new_categories)
            return render(request, 'form-confirmation.html')


class AddDonationConfiramtion(View):
    def get(self, request):
        return render(request, 'form-confirmation.html')


class LoginView(FormView):
    form_class = LoginForm  # z jakiego formularza korzysta; z forms.py
    template_name = 'login.html'

    def form_valid(self, form):  # form_valid(form)¶ Redirects to get_success_url().
        print(form.cleaned_data)
        user = authenticate(username=form.cleaned_data['login'],
                            # authenticate(username=username, password=password) Funkcja zwraca obiekt User (jeśli uwierzytelnienie się powiodło) lub None , jeśli było nieudane.
                            password=form.cleaned_data['password'])
        if user is not None:
            login(self.request, user)  # login(request, user, backend=None)¶
        else:
            return redirect(reverse_lazy('register'))  # jeśli logowanie się nie uda
        return redirect(reverse_lazy('index'))


class RegisterView(FormView):
    template_name = 'register.html'
    form_class = UserRegisterForm
    success_url = reverse_lazy('login')

    def form_valid(self, form):
        form.save()
        return super().form_valid(form)


class LogoutView(View):
    def get(self, request):
        logout(request)
        return redirect(reverse_lazy("index"))


class ProfileView(View):
    def get(self, request):
        user = MyUser.objects.get(pk=self.request.user.id)
        donations = Donation.objects.filter(user_id=user.id)
        categories = Category.objects.all()
        ctx = {
            'first_name': user.first_name,
            'last_name': user.last_name,
            'email': user.email,
            'donations': donations,
            'categories': categories,
        }
        return render(request, 'profile.html', ctx)
