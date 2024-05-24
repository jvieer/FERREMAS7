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

#LOGICAS API

API_URL = "http://127.0.0.1:5000"

@permission_required('app.add')

def add(request):
    data = {
        'form': ProductoForm()
    }
    if request.method == 'POST':
        formulario = ProductoForm(request.POST, files=request.FILES)
        if formulario.is_valid():
            # Extraer datos del formulario
            producto_data = {
                'id': formulario.cleaned_data['id'],  # Cambiado a 'id'
                'nombre': formulario.cleaned_data['nombre'],
                'cod_marca': formulario.cleaned_data['cod_marca'],
                'nombre_marca': formulario.cleaned_data['nombre_marca'],
                'precio': formulario.cleaned_data['precio'],
                'stock': formulario.cleaned_data['stock'],
                'imagen_url': formulario.cleaned_data.get('imagen_url')  # Si tienes campo para la URL de la imagen
            }

            # Enviar datos a la API
            response = requests.post(f"{API_URL}/productos", json=producto_data)

            if response.status_code == 200:
                messages.success(request, "Producto almacenado correctamente")
                return redirect('index')  # Redirigir a la página de productos o a donde prefieras
            else:
                messages.error(request, f"Error al almacenar el producto: {response.text}")

    return render(request, 'core/add-product.html', data)

def update(request, id):
    try:
        if request.method == 'POST':
            form = ProductoForm(request.POST)  # Obtener los datos del formulario enviado por el usuario
            if form.is_valid():
                # Si el formulario es válido, enviar los datos actualizados a la API para actualizar el producto
                url = f"http://127.0.0.1:5000/productos/{id}"
                response = requests.put(url, json=form.cleaned_data)
                if response.status_code == 200:
                    messages.success(request, '¡El producto se ha actualizado correctamente!')
                    # Si la actualización en la API fue exitosa, redirigir al usuario a la página de detalles del producto
                    return redirect('index')
                else:
                    # Manejar el caso en que la actualización en la API falle
                    data = {'error': 'No se pudo actualizar el producto en la API'}
                    return render(request, 'core/update-product.html', data)
        else:
            # Si la solicitud no es POST, obtener los detalles del producto de la API y mostrar el formulario
            url = f"http://127.0.0.1:5000/productos/{id}"
            response = requests.get(url)
            if response.status_code == 200:
                producto = response.json()
                data = {'form': ProductoForm(initial=producto), 'id': id}
                return render(request, 'core/update-product.html', data)
            else:
                data = {'error': 'No se pudo obtener el producto de la API'}
                return render(request, 'core/update-product.html', data)
    except Exception as e:
        # Manejar cualquier error que ocurra durante el proceso
        data = {'error': str(e)}
        return render(request, 'core/update-product.html', data)

def delete(request, id):
    try:
        # Realizar la solicitud DELETE a la API para eliminar el producto
        url = f"http://127.0.0.1:5000/productos/{id}"
        response = requests.delete(url)
        
        if response.status_code == 200:
            # Si la eliminación en la API fue exitosa, redirigir al usuario al índice con un mensaje de éxito
            success_message = '¡El producto se ha eliminado correctamente!'
            return redirect('index')
        else:
            # Manejar el caso en que la eliminación en la API falle
            data = {'error': 'No se pudo eliminar el producto en la API'}
            return render(request, 'core/index.html', data)
    except Exception as e:
        # Manejar cualquier error que ocurra durante el proceso
        data = {'error': str(e)}
        return render(request, 'core/index.html', data)

def cart(request):
    try:
        carro_compras = CarroCompras.objects.get(usuario=request.user)
        items = carro_compras.items.all()
    except CarroCompras.DoesNotExist:
        items = []
    
    total = 0
    items_data = []

    for item in items:
        response = requests.get(f"{API_URL}/productos/{item.producto_id_api}")
        if response.status_code == 200:
            producto = response.json()
            subtotal = producto['precio'] * item.cantidad
            total += subtotal
            items_data.append({
                'producto': producto,
                'cantidad': item.cantidad,
                'subtotal': subtotal,
                'id': item.producto_id_api
            })

    respuesta = requests.get('https://mindicador.cl/api/dolar').json()
    valor_usd = respuesta['serie'][0]['valor']
    valor_total = total / valor_usd

    data = {
        'total': round(valor_total, 2),
        'items': items_data,
    }

    return render(request, 'core/cart.html', data)

def cartadd(request, id):
    # Obtener el producto de la API en lugar de la base de datos local
    response = requests.get(f"{API_URL}/productos/{id}")
    if response.status_code != 200:
        # Manejar el caso donde no se puede obtener el producto de la API
        # Puedes redirigir a una página de error o mostrar un mensaje al usuario
        return redirect('index')

    producto = response.json()

    # Crear o obtener el carrito de compras del usuario
    carro_compras, created = CarroCompras.objects.get_or_create(usuario=request.user)

    # Crear o actualizar el elemento del carrito para el producto
    carro_item, item_created = CarroItem.objects.get_or_create(producto_id_api=producto['id'], usuario=request.user)

    if not item_created:
        carro_item.cantidad += 1
        carro_item.save()

    # Agregar el elemento del carrito al carrito de compras
    carro_compras.items.add(carro_item)
    carro_compras.save()

    # No necesitas actualizar el stock del producto aquí, ya que eso se manejará en la API

    return redirect('index')


def cartdel(request, id):
    # Realizamos una solicitud a tu API para obtener la información del producto
    response = requests.get(f"{API_URL}/productos/{id}")
    
    if response.status_code == 200:
        producto_data = response.json()
        try:
            # Intentamos obtener el carrito de compras del usuario actual
            carro_compras = CarroCompras.objects.get(usuario=request.user)
            # Buscamos el item en el carrito basado en el ID del producto de la API
            carro_item = carro_compras.items.get(producto_id_api=id)
            
            # Verificamos si hay más de un producto en el carrito
            if carro_item.cantidad > 1:
                # Si hay más de un producto, simplemente disminuimos la cantidad
                carro_item.cantidad -= 1
                carro_item.save()
            else:
                # Si hay solo un producto, lo eliminamos del carrito
                carro_compras.items.remove(carro_item)
                carro_item.delete()

                # Incrementar el stock del producto cuando se elimina del carrito
                # (suponiendo que tengas un endpoint en tu API para realizar esta acción)
                # Esto es opcional y depende de cómo manejes tu API
                requests.post(f"{API_URL}/incrementar_stock/{id}")

        except CarroCompras.DoesNotExist:
            # Manejar el caso en que no se encuentre el carrito de compras del usuario actual
            # Esto puede suceder si el usuario no ha agregado ningún producto al carrito antes
            pass

        return redirect('cart')
    else:
        # Manejar el caso en que no se pueda obtener la información del producto desde la API
        # Por ejemplo, mostrar un mensaje de error al usuario
        return HttpResponse("Error al obtener la información del producto de la API", status=response.status_code)


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




import requests
from django.http import HttpResponse
from .models import CarroCompras






def cartdelete(request, id):
    # Buscar el carro_compras del usuario actual
    carro_compras = CarroCompras.objects.get(usuario=request.user)
    
    # Buscar el carro_item asociado al producto con el identificador recibido
    # del carrito del usuario
    try:
        carro_item = carro_compras.items.get(producto_id_api=id)
    except CarroItem.DoesNotExist:
        # Si el carro_item no existe, simplemente redirige al carrito
        return redirect('cart')

    # Eliminar el carro_item del carrito y guardar los cambios
    carro_compras.items.remove(carro_item)
    carro_item.delete()

    return redirect('cart')

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
@user_passes_test(lambda u: u.groups.filter(name='vendedor').exists())
def ordenar_pedidos(request):
    pedidos = Pedido.objects.all()
    return render(request, 'core/ordenar_pedidos.html', {'pedidos': pedidos})

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

def ordenar_pedidos(request):
    if request.method == 'POST':
        bodeguero_id = request.POST.get('bodeguero')
        descripcion = request.POST.get('descripcion')  # Obtener la descripción de la orden del formulario

        try:
            bodeguero = User.objects.get(pk=bodeguero_id)  # Obtiene el objeto del bodeguero
            # Procesa la orden y guárdala en la base de datos con la descripción proporcionada
            orden = Orden(bodeguero=bodeguero, descripcion=descripcion)
            orden.save()
            # Agrega un mensaje para confirmar que se ha ordenado correctamente
            messages.success(request, 'Se ha ordenado el pedido correctamente.')
        except User.DoesNotExist:
            # Maneja el caso donde no se encuentra al usuario
            messages.error(request, 'El bodeguero seleccionado no existe.')
        
        # Redirige a la misma página para evitar reenvíos de formulario
        return redirect('ordenar_pedidos')
    else:
        # Si la solicitud no es POST, simplemente renderiza la página con la lista de bodegueros
        usuarios_bodegueros = User.objects.filter(groups__name='bodeguero')  # Filtra los usuarios por grupo 'bodeguero'
        historial_ordenes = Orden.objects.all()  # Puedes filtrar el historial según tus necesidades
        return render(request, 'core/ordenar_pedidos.html', {'usuarios_bodegueros': usuarios_bodegueros, 'historial_ordenes': historial_ordenes})
@login_required
@user_passes_test(lambda u: u.groups.filter(name='bodeguero').exists())
def ordenes_pedidos(request):
    if request.method == 'POST':
        vendedor_id = request.POST.get('vendedor')
        mensaje = request.POST.get('mensaje')
        try:
            vendedor = User.objects.get(pk=vendedor_id)
            orden = OrdenB(vendedor=vendedor, descripcion=mensaje)
            orden.save()
            messages.success(request, 'Se ha enviado la orden al vendedor correctamente.')
        except User.DoesNotExist:
            messages.error(request, 'El vendedor seleccionado no existe.')
        return redirect('ordenes_pedidos')
    else:
        vendedores = User.objects.filter(groups__name='vendedor')
        historial_ordenes = OrdenB.objects.all()
        return render(request, 'core/ordenes_pedidos.html', {'vendedores': vendedores, 'historial_ordenes': historial_ordenes})