from django.contrib import admin
from django.urls import reverse
from django.utils.html import format_html
from .models import *

# Custom User Admin
class CustomUserAdmin(admin.ModelAdmin):
    def asignar_roles_link(self, obj):
        return format_html('<a href="{}">Asignar Roles</a>', reverse('asignar_roles'))

    asignar_roles_link.short_description = "Asignar Roles"
    asignar_roles_link.allow_tags = True

    actions = ['asignar_roles_link']

# Marca Admin
class MarcaAdmin(admin.ModelAdmin):
    list_display = ['cod_marca', 'nombre_marca']
    search_fields = ['nombre_marca']
    list_per_page = 10

# Producto Admin
class ProductoAdmin(admin.ModelAdmin):
    list_display = ['id_producto', 'nombre', 'precio', 'stock', 'cod_marca', 'imagen_url', 'created_at', 'updated_at']
    search_fields = ['nombre', 'cod_marca__nombre_marca']
    list_per_page = 10
    list_editable = ['precio', 'stock', 'cod_marca', 'imagen_url']
    list_filter = ['cod_marca', 'stock']

# CarroItem Admin
class CarroItemAdmin(admin.ModelAdmin):
    list_display = ['id', 'producto', 'cantidad', 'usuario', 'created_at', 'updated_at']
    search_fields = ['producto__nombre']
    list_per_page = 5
    list_filter = ['producto', 'usuario']

# Compra Admin
class CompraAdmin(admin.ModelAdmin):
    list_display = ['id', 'usuario', 'fecha', 'created_at', 'updated_at']
    search_fields = ['usuario__username']
    list_per_page = 5
    list_filter = ['usuario', 'fecha']

# CompraItem Admin
class CompraItemAdmin(admin.ModelAdmin):
    list_display = ['id', 'compra', 'carro_item', 'created_at', 'updated_at']
    search_fields = ['compra__usuario__username']
    list_per_page = 5
    list_filter = ['compra']

# CarroCompras Admin
class CarroComprasAdmin(admin.ModelAdmin):
    list_display = ['id', 'usuario', 'created_at', 'updated_at']
    search_fields = ['usuario__username']
    list_per_page = 5
    list_filter = ['usuario']

# Registering Models
admin.site.register(Marca, MarcaAdmin)
admin.site.register(Producto, ProductoAdmin)
admin.site.register(CarroItem, CarroItemAdmin)
admin.site.register(Compra, CompraAdmin)
admin.site.register(CompraItem, CompraItemAdmin)
admin.site.register(CarroCompras, CarroComprasAdmin)

# Optional: Register CustomUserAdmin if you have a Custom User model
# from django.contrib.auth import get_user_model
# User = get_user_model()
# admin.site.register(User, CustomUserAdmin)
