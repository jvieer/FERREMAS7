from .models import *
from rest_framework import serializers

# Serializer para Marca
class MarcaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Marca
        fields = '__all__'

# Serializer para Producto
class ProductoSerializer(serializers.ModelSerializer):
    cod_marca = MarcaSerializer(read_only=True)

    class Meta:
        model = Producto
        fields = '__all__'

# Serializer para CarroItem
class CarroItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = CarroItem
        fields = '__all__'

# Serializer para CarroCompras
class CarroComprasSerializer(serializers.ModelSerializer):
    class Meta:
        model = CarroCompras
        fields = '__all__'


# Serializer para Compra
class CompraSerializer(serializers.ModelSerializer):
    class Meta:
        model = Compra
        fields = '__all__'

# Serializer para CompraItem
class CompraItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = CompraItem
        fields = '__all__'
