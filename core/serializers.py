# SE ENCARGA DE CONVERTIR LA DATA
from .models import *
from rest_framework import serializers

class TipoProductoSerializer(serializers.ModelSerializer):
    class Meta:
        model = TipoProducto
        fields = '__all__'

class ProductoSerializer(serializers.ModelSerializer):
    tipo = TipoProductoSerializer(read_only=True)

    class Meta:
        model = Producto
        fields = '__all__'

class CarroItemSerializer(serializers.ModelSerializer):

    class Meta:
        model = CarroItem
        fields = '__all__'

class CarroComprasSerializer(serializers.ModelSerializer):

    class Meta:
        model = CarroCompras
        fields = '__all__'

# SERIALIZER - VIEWSET - URL