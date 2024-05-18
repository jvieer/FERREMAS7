from django.urls import path, include
from .views import *
from rest_framework import routers

router = routers.DefaultRouter()
router.register('productos',ProductoViewset)
router.register('CarroItem',CarroItemViewset)
router.register('CarroCompras',CarroComprasViewset)
router.register('marca', MarcaViewset)  # Registrar el ViewSet de Marca
router.register('compra-item', CompraItemViewset)  # Registrar el ViewSet de CompraItem


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
    
    

    # Vistas de Administrador
    path('admin/informes_venta/', informes_venta, name='informes_venta'),
    path('admin/informes_desempeno/', informes_desempeno, name='informes_desempeno'),
    path('admin/estrategias_ventas/', estrategias_ventas, name='estrategias_ventas'),

    # Vistas de Vendedor/Encargado
    path('vendedor/asesoramiento/', asesoramiento, name='asesoramiento'),
    path('vendedor/procesar_pedidos/', procesar_pedidos, name='procesar_pedidos'),
    path('vendedor/gestion_pagos/', gestion_pagos, name='gestion_pagos'),

    # Vistas de Bodeguero
    path('bodeguero/organizar_inventario/', organizar_inventario, name='organizar_inventario'),
    path('bodeguero/preparar_entrega/', preparar_entrega, name='preparar_entrega'),
    path('bodeguero/almacenamiento_materiales/', almacenamiento_materiales, name='almacenamiento_materiales'),

    # Vistas de Contador
    path('contador/registro_transacciones/', registro_transacciones, name='registro_transacciones'),
    path('contador/control_finanzas/', control_finanzas, name='control_finanzas'),
    path('contador/elaborar_reportes/', elaborar_reportes, name='elaborar_reportes'),

    
]

