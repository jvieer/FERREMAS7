from django.shortcuts import render, redirect
from .models import *
from .forms import *
from django.contrib import messages
from django.core.paginator import Paginator
from django.contrib.auth import authenticate, login
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required, permission_required, user_passes_test
from rest_framework import viewsets
from .serializers import *
import requests 
from django.shortcuts import render, get_object_or_404
from django.contrib.auth.models import Group
from .forms import CustomUserCreationForm
from django.contrib.auth.forms import UserCreationForm

from django.shortcuts import render
from django.contrib.auth.forms import PasswordResetForm
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_encode
from django.utils.encoding import force_bytes
from django.contrib.auth.tokens import default_token_generator
from django.contrib.auth.models import User
from django.http import HttpResponse

# Create your views here.

#funcion generica que valida grupos
#USO : @grupo_requerido('cliente')
def grupo_requerido(nombre_grupo):
	def decorator(view_func):
		@user_passes_test(lambda user: user.groups.filter(name=nombre_grupo).exists())
		def wrapper(request, *args, **kwargs):
			return view_func(request, *args, **kwargs)
		return wrapper
	return decorator



# ViewSets para los modelos
class ProductoViewset(viewsets.ModelViewSet):
    queryset = Producto.objects.all()
    serializer_class = ProductoSerializer

class MarcaViewset(viewsets.ModelViewSet):
    queryset = Marca.objects.all()
    serializer_class = MarcaSerializer

class CarroItemViewset(viewsets.ModelViewSet):
    queryset = CarroItem.objects.all()
    serializer_class = CarroItemSerializer

class CarroComprasViewset(viewsets.ModelViewSet):
    queryset = CarroCompras.objects.all()
    serializer_class = CarroComprasSerializer

class CompraViewset(viewsets.ModelViewSet):
    queryset = Compra.objects.all()
    serializer_class = CompraSerializer

class CompraItemViewset(viewsets.ModelViewSet):
    queryset = CompraItem.objects.all()
    serializer_class = CompraItemSerializer

	
    
def indexapi(request):
	#REALIZAMOS LA SOLICITUD AL API
	respuesta = requests.get('http://127.0.0.1:8000/api/productos/')
	respuesta2 = requests.get('https://mindicador.cl/api')
	respuesta3 = requests.get('https://rickandmortyapi.com/api/character')
	# TRANSFORMAMOS EL JSON
	productos = respuesta.json()
	monedas = respuesta2.json()
	aux = respuesta3.json()
	personajes = aux['results']

	data = {
		'listaProductos': productos,
		'monedas': monedas,
		'personajes': personajes,
	}
	return render(request, 'core/indexapi.html', data)

	#API ANIMALES
def blogapi(request):
	#Solicitud al api
	respuesta4 = requests.get('https://dog.ceo/api/breeds/image/random')
	#TRANSFORMAMOS A JSON
	animales = respuesta4.json()

	data = {
		'animales' : animales,
	}
	return render(request, 'core/blogapi.html', data)

def index(request):
    try:
        # Obtener datos de la API
        response = requests.get('http://127.0.0.1:5000/productos')
        response.raise_for_status()  # Lanza una excepción si la solicitud no es exitosa
        productos_api = response.json()

        # Paginar los productos
        paginator = Paginator(productos_api, 8)
        page_number = request.GET.get('page', 1)
        page_obj = paginator.get_page(page_number)

        # Determinar roles del usuario
        user = request.user
        roles = {
            'is_admin': user.groups.filter(name='administrador').exists(),
            'is_vendedor': user.groups.filter(name='vendedor').exists(),
            'is_bodeguero': user.groups.filter(name='bodeguero').exists(),
            'is_contador': user.groups.filter(name='contador').exists(),
        }

    except Exception as e:
        print(f"Error al obtener datos de la API: {e}")
        raise Http404

    data = {
        'page_obj': page_obj,
        'roles': roles,
    }
    return render(request, 'core/index.html', data)

def blog(request):
	return render(request, 'core/blog.html')


#def cart(request):
    
   #carro_compras = CarroCompras.objects.get(usuario=request.user)
   #tems = carro_compras.items.all()
   #otal = carro_compras.total()

   #ata = {
   #   'items': items,
   #   'total': total,
   #

   #eturn render(request,'core/cart.html',data)
  
def cart(request):
    carro_compras = CarroCompras.objects.get(usuario=request.user)
    items = carro_compras.items.all()
    total = carro_compras.total()
    respuesta = requests.get('https://mindicador.cl/api/dolar').json()
    valor_usd = respuesta['serie'][0]['valor']
    valor_carrito = 'total' # SE SUPONE QUE ES EL TOTAL DEL CARRITO
    valor_total = total / valor_usd

    for item in items:
        producto = item.producto

        # Actualizar el stock del producto restando 1 por cada elemento del carrito
        producto.stock -= 1
        producto.save()

    data = {
        'total': round(valor_total, 2),
        'items': items,
    }

    return render(request, 'core/cart.html', data)

def cartUser(request):
	return render(request, 'core/cartUser.html')

def category(request):
	productosAll = Producto.objects.all()
	data = {
		'listaProductos' : productosAll
	}
	return render(request, 'core/category.html', data)	
		
def checkout(request):
	return render(request, 'core/checkout.html')		
						
def confirmation(request):
	return render(request, 'core/confirmation.html')

def contact(request):
	return render(request, 'core/contact.html')


def forgot_password(request):
    if request.method == 'POST':
        form = PasswordResetForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data['email']
            user = User.objects.get(email=email)
            token = default_token_generator.make_token(user)
            uid = urlsafe_base64_encode(force_bytes(user.pk))
            reset_url = f"http://example.com/reset-password/{uid}/{token}/"

            # Envía el correo electrónico de restablecimiento de contraseña
            subject = 'Restablecimiento de contraseña'
            message = render_to_string('core/password_reset.html', {
                'user': user,
                'reset_url': reset_url,
            })
            send_mail(subject, message, 'tu_correo@gmail.com', [email])
            
            return render(request, 'core/password_reset.html')
    else:
        form = PasswordResetForm()
    return render(request, 'core/forgot_password.html', {'form': form})


def password_reset(request):
	return render(request, 'core/password_reset.html')			

def indexUser(request):
	return render(request, 'core/indexUser.html')				
						
def indexUserSubscito(request):
	return render(request, 'core/indexUserSubscito.html')	

def login(request):
	return render(request, 'core/login.html')
		
def perfil(request):
	return render(request, 'core/perfil.html')	

def register(request):
	return render(request, 'core/register.html')

def singleblog(request):
	return render(request, 'core/single-blog.html')

def singleproduct(request, id):
    producto = Producto.objects.get(id=id) #buscamos un producto por su id (primer campo base de datos y el otro es nuestro)
    data = {
        #'form' : ProductoForm(instance=producto) #Carga la info en el formulario
        'producto' : producto
    }
        

    return render(request,'core/single-product.html',data)

def subsForm(request):
	return render(request, 'core/subsForm.html')

def trackingorder(request):
    if request.method == 'POST':
        pedido_id = request.POST.get('pedido_id')
        pedido = get_object_or_404(Pedido, id=pedido_id)
        return render(request, 'tracking-order.html', {'pedido': pedido})
    return render(request, 'core/tracking-order.html')


#crud
@permission_required('app.add')
def add(request):
	data = {
		'form': ProductoForm()
	}
	if request.method == 'POST':
		formulario = ProductoForm(request.POST, files=request.FILES)
		if formulario.is_valid():
			formulario.save()
			#data['msj'] = "Producto almacenado correctamente"
			messages.success(request, "Producto almacenado correctamente")

	return render(request, 'core/add-product.html', data)
@permission_required('app.update/<id>/')
def update(request,id):
	producto = Producto.objects.get(id=id)
	data = {
		'form': ProductoForm(instance=producto)
	}
	if request.method == 'POST':
		formulario = ProductoForm(data=request.POST, instance=producto)
		if formulario.is_valid():
			formulario.save()
			#data['msj'] = "Producto actualizado correctamente"
			messages.success(request, "Producto actualizado correctamente")
			data['form'] = formulario

	return render(request, 'core/update-product.html', data)
@permission_required('app.delete/<id>/')
def delete(request,id):
    producto = Producto.objects.get(id=id); # OBTENEMOS UN PRODUCTO
    producto.delete()

    return redirect(to="index")


def registro(request):
    data = {
        'form': CustomUserCreationForm()
    }
    if request.method == 'POST':
        formulario = CustomUserCreationForm(data=request.POST)
        if formulario.is_valid():
            user = formulario.save()
            messages.success(request, "Te has registrado correctamente")
            return redirect(to="index")  # Redirige al usuario al index después de registrarse
        data["form"] = formulario

    return render(request, 'registration/registro.html', data)



@login_required
def checkout(request):
    carro_compras = CarroCompras.objects.get(usuario=request.user)
    items = carro_compras.items.all()
    total = carro_compras.total()

    total_productos = 0
    for item in items:
        total_productos += item.producto.precio * item.cantidad

    valor_fijo = 7560
    total_final = total_productos + valor_fijo

    data = {
        'items': items,
        'total': total,
        'total_final' : total_final
    }

    if request.method == 'POST':
        # Crear la compra en la base de datos
        compra = Compra.objects.create(usuario=request.user, total=total_final)

        # Crear los elementos de compra asociados
        for item in items:
            CompraItem.objects.create(compra=compra, producto=item.producto, cantidad=item.cantidad)

        # Limpiar el carrito de compras después de que la compra se haya completado con éxito
        carro_compras.items.clear()

        # Redirigir al usuario al historial de pedidos
        messages.success(request, "¡Pago realizado correctamente!")
        return redirect('order_history')

    return render(request,'core/checkout.html',data)
    
@login_required
def confirmation(request):
    compras = Compra.objects.filter(usuario=request.user)
    return render(request, 'core/confirmation.html', {'compras': compras})

@login_required
def order_history(request):
    compras = Compra.objects.filter(usuario=request.user)
    return render(request, 'core/order_history.html', {'compras': compras})


def cartadd(request, id):
    producto = Producto.objects.get(id=id)
    carro_compras, created = CarroCompras.objects.get_or_create(usuario=request.user)
    carro_item, item_created = CarroItem.objects.get_or_create(producto=producto, usuario=request.user)

    if not item_created:
        carro_item.cantidad += 1
        carro_item.save()

    carro_compras.items.add(carro_item)
    carro_compras.save()

    # Descuentar el stock del producto cuando se agrega al carrito
    producto.stock -= 1
    producto.save()

    return redirect('cart')

def cartdel(request, id):
    producto = Producto.objects.get(id=id)
    carro_compras = CarroCompras.objects.get(usuario=request.user)
    carro_item = carro_compras.items.get(producto=producto)

    if carro_item.cantidad > 1:
        carro_item.cantidad -= 1
        carro_item.save()
    else:
        carro_compras.items.remove(carro_item)
        carro_item.delete()

        # Incrementar el stock del producto cuando se elimina el elemento del carrito
        producto.stock += 1
        producto.save()

    return redirect('cart')

def cartdelete(request,id):
    producto = Producto.objects.get(id=id)
    carro_compras = CarroCompras.objects.get(usuario = request.user)
    carro_item = carro_compras.items.get(producto=producto)

    carro_compras.items.remove(carro_item)
    carro_item.delete()

    
    return redirect(to='cart')

def add_compra(request): 
    carro_compras = CarroCompras.objects.get(usuario = request.user)
    items = carro_compras.items.all()

    compra = Compra.objects.create(usuario = request.user)
    for item in items:
        CompraItem.objects.create(compra = compra, carro_item = item)

    carro_compras.items.clear()
    return redirect(to='confirmation')





def agregar_suscriptor(request, id):
    usuario = User.objects.get(id=id)
    usuario.groups.add(5)
    usuario.save()
    return redirect('index')

@permission_required('core.view_producto')
def subsForm(request):
    if request.method == 'POST':
        form = DonacionForm(request.POST)
        if form.is_valid():
            # Procesa la donación (por ejemplo, guarda la cantidad en la base de datos)
            cantidad = form.cleaned_data['cantidad']
            # Realiza cualquier otro procesamiento necesario

            # Redirige a la página de confirmación de donación exitosa o a la página de PayPal
            return render(request, 'core/confirmation.html')
    else:
        form = DonacionForm()

    return render(request, 'core/subsForm.html', {'form': form})


@login_required
@permission_required('auth.change_user')
def asignar_roles(request):
    if request.method == 'POST':
        usuario_id = request.POST.get('usuario_id')
        nuevo_rol = request.POST.get('nuevo_rol')
        accion = request.POST.get('accion')

        try:
            usuario = User.objects.get(pk=usuario_id)
            usuario_nombre = usuario.username

            if accion == 'agregar' and nuevo_rol:
                grupo = Group.objects.get(name=nuevo_rol)
                usuario.groups.add(grupo)
                messages.success(request, f"Se asignó el rol '{nuevo_rol}' al usuario '{usuario_nombre}' correctamente.")
            elif accion == 'quitar' and nuevo_rol:
                grupo = Group.objects.get(name=nuevo_rol)
                usuario.groups.remove(grupo)
                messages.success(request, f"Se quitó el rol '{nuevo_rol}' al usuario '{usuario_nombre}' correctamente.")
            else:
                messages.warning(request, "Acción no válida o rol no especificado.")
        except User.DoesNotExist:
            messages.error(request, f"El usuario con ID '{usuario_id}' no existe.")
        except Group.DoesNotExist:
            messages.error(request, f"El grupo '{nuevo_rol}' no existe.")

        return redirect('asignar_roles')

    usuarios = User.objects.all()
    grupos = Group.objects.all()
    
    # Obtener los roles del usuario seleccionado
    roles_usuario = None
    usuario_id = request.GET.get('usuario_id')  # Obtener el usuario seleccionado del query string
    if usuario_id:
        try:
            usuario_seleccionado = User.objects.get(pk=usuario_id)
            roles_usuario = usuario_seleccionado.groups.values_list('name', flat=True)
        except User.DoesNotExist:
            pass

    return render(request, 'core/asignar_roles.html', {'usuarios': usuarios, 'grupos': grupos, 'roles_usuario': roles_usuario})



@login_required
@user_passes_test(lambda u: u.groups.filter(name='vendedor').exists())
def productos_bodega(request):
    productos = Producto.objects.filter(stock__gt=0)
    return render(request, 'core/productos_bodega.html', {'productos': productos})

@login_required
@user_passes_test(lambda u: u.groups.filter(name='vendedor').exists())
def gestionar_pedidos(request):
    pedidos = Pedido.objects.all()
    return render(request, 'core/gestionar_pedidos.html', {'pedidos': pedidos})

@login_required
@user_passes_test(lambda u: u.groups.filter(name='bodeguero').exists())
def ordenes_pedidos(request):
    pedidos = Pedido.objects.all()
    return render(request, 'core/ordenes_pedidos.html', {'pedidos': pedidos})

@login_required
@user_passes_test(lambda u: u.groups.filter(name='bodeguero').exists())
def preparar_pedidos(request):
    pedidos = Pedido.objects.filter(estado='pendiente')
    return render(request, 'core/preparar_pedidos.html', {'pedidos': pedidos})

@login_required
@user_passes_test(lambda u: u.groups.filter(name='contador').exists())
def confirmar_pagos(request):
    pagos = Pago.objects.filter(estado='pendiente')
    return render(request, 'core/confirmar_pagos.html', {'pagos': pagos})

@login_required
@user_passes_test(lambda u: u.groups.filter(name='contador').exists())
def registrar_entregas(request):
    entregas = Entrega.objects.all()
    return render(request, 'core/registrar_entregas.html', {'entregas': entregas})

# Agregar un manejo de excepciones para mostrar un mensaje de error y redirigir al index
def permission_denied_view(request):
    messages.error(request, "No tienes permiso para acceder a esta página.")
    return redirect('index')

def productos_bodega(request):
    try:
        # Obtener datos de la API
        response = requests.get('http://127.0.0.1:5000/productos')
        response.raise_for_status()  # Lanza una excepción si la solicitud no es exitosa
        productos_api = response.json()

        # Paginar los productos
        paginator = Paginator(productos_api, 8)
        page_number = request.GET.get('page', 1)
        page_obj = paginator.get_page(page_number)

        # Renderizar la plantilla con los datos paginados
        return render(request, 'core/productos_bodega.html', {'page_obj': page_obj})

    except RequestException as e:
        # Manejar cualquier error de solicitud de la API
        error_message = f"Error al obtener datos de la API: {str(e)}"
        return render(request, 'core/productos_bodega.html', {'error_message': error_message})
    
        def gestionar_pedidos(request):
            pedidos = Pedido.objects.all()
            return render(request, 'core/gestionar_pedidos.html', {'pedidos': pedidos})
            
def aceptar_pedido(request, pedido_id):
    pedido = Pedido.objects.get(pk=pedido_id)
    pedido.estado = 'completado'
    pedido.save()
    return redirect('gestionar_pedidos')

def rechazar_pedido(request, pedido_id):
    pedido = Pedido.objects.get(pk=pedido_id)
    pedido.estado = 'cancelado'
    pedido.save()
    return redirect('gestionar_pedidos')
