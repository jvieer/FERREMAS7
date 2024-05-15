from django.urls import path, include
from .views import *
from rest_framework import routers

router = routers.DefaultRouter()
router.register('productos',ProductoViewset)
router.register('TipoProducto',TipoProductoViewset)
router.register('CarroItem',CarroItemViewset)
router.register('CarroCompras',CarroComprasViewset)

urlpatterns = [
    # API
    path('api/', include(router.urls)),




    path('', index, name = "index"),
    path('indexapi/', indexapi, name = "indexapi"),
    path('blog/', blog, name = "blog"),
    path('blogapi/', blogapi, name = "blogapi"),
    path('cart/', cart, name = "cart"),
    path('cartUser/', cartUser, name = "cartUser"),
    path('category/', category, name = "category"),
    path('checkout/', checkout, name = "checkout"),
    path('confirmation/', confirmation, name = "confirmation"),
    path('order_history/', order_history, name="order_history"),
    path('contact/', contact,name = "contact"),
    path('forgot-password/', forgot_password, name='forgot_password'),
    path('indexUser/', indexUser,name = "indexUser"),
    path('indexUserSubscito/', indexUserSubscito, name = "indexUserSubscito"),
    path('login/', login,name = "login"),
    path('perfil/', perfil,name = "perfil"),
    path('registro/', registro,name = "registro"),
    path('singleblog/', singleblog, name="singleblog"),
    path('singleproduct/<id>', singleproduct, name="singleproduct"),
    path('subsForm/', subsForm,name = "subsForm"),
    path('trackingorder/', trackingorder,name = "tracking-order"),
    path('asignar-roles/', asignar_roles, name='asignar_roles'),
    path('password_reset/', password_reset, name='password_reset'),
    #path('remover_grupo/<int:usuario_id>/<int:grupo_id>/', remover_grupo, name='remover_grupo'),




    #CRUD
    path('add/', add,name = "add"),
    path('update/<id>/', update,name = "update"),
    path('delete/<id>/', delete, name= "delete"),
    path('cartadd/<id>/', cartadd, name="cartadd"),
    path('cart/cartdel/<id>/', cartdel, name="cartdel"),
    path('cart/cartadd/<id>',cartadd, name="cartaddd"),
    path('cart/cartdelete/<id>',cartdelete, name="cartdelete"),
    path('add_compra/', add_compra, name="add_compra"),
    path('suscribir/<id>/', agregar_suscriptor, name="suscribir"),
    
    


    
]

