from django import forms
from django.forms import ModelForm
from .models import *
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from django.core.exceptions import ValidationError






class ProductoForm(forms.Form):
    id = forms.CharField(max_length=20, label="id")  # Usado como 'id' en la API
    nombre = forms.CharField(max_length=100)
    cod_marca = forms.CharField(max_length=100)
    nombre_marca = forms.CharField(max_length=150)
    precio = forms.IntegerField()
    stock = forms.IntegerField()
    imagen_url = forms.CharField()



class DonacionForm(forms.Form):
    cantidad = forms.DecimalField(label='Cantidad a donar', decimal_places=2, max_digits=10)



class CustomUserCreationForm(UserCreationForm):
    
    username = forms.CharField(label='Usuario', min_length=4, max_length=150)
    first_name = forms.CharField(label='Nombre' , min_length=0, max_length=150)
    last_name = forms.CharField(label='Apellido' , min_length=0, max_length=150)
    email = forms.EmailField(label='Email')
    password1 = forms.CharField(label='Contraseña', widget=forms.PasswordInput)
    password2 = forms.CharField(label='Confirmar Contraseña', widget=forms.PasswordInput)

    def clean_username(self):
        username = self.cleaned_data['username'].lower()
        r = User.objects.filter(username=username)
        if r.count():
            raise  ValidationError("Usuario ya existe")
        return username
    

    def clean_first_name(self):
        username = self.cleaned_data['first_name'].lower()
        r = User.objects.filter(username=username)
        return username
    
    def clean_last_name(self):
        username = self.cleaned_data['last_name'].lower()
        r = User.objects.filter(username=username)
        return username

    def clean_email(self):
        email = self.cleaned_data['email'].lower()
        r = User.objects.filter(email=email)
        if r.count():
            raise  ValidationError("Email ya existe")
        return email

    def clean_password2(self):
        password1 = self.cleaned_data.get('password1')
        password2 = self.cleaned_data.get('password2')

        if password1 and password2 and password1 != password2:
            raise ValidationError("Contraseñas no coinciden")

        return password2

    def save(self, commit=True):
        user = User.objects.create_user(
            self.cleaned_data['username'],
            self.cleaned_data['email'],
            self.cleaned_data['password1']
        )
        return user
    
    