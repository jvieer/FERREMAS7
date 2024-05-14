class Carrito:
    def __init__(self, request):
        self.request = request
        self.session = request.session
        carrito = self.session.get("carrito")
        if not carrito:
            carrito = self.session["carrito"] = {}
        self.carrito = carrito

    def add(self, producto):
        if str(producto.id) not in self.carrito.keys():
            self.cart.producto.id = {
                "producto_id": producto_id,
                "nombre": producto_nombre,
                "cantidad": 1,
                "precio": str(producto.precio),
                "imagen": producto.imagen.url
            }
        else:
            for key, value in self.carrito.items():
                if key == str(producto.id):
                    value["cantidad"] = value["cantidad"] + 1
                    break
        self.save()

    def save(self):
        self.session["carrito"] = self.carrito
        self.session.modified = True

    def remove(self.producto):
        producto_id = str(producto.id)
        if(producto_id in self.carrito):
            del self.carrito[producto_id]
            self.save()

    def decrement(self producto):
        for key, value in self.carrito.items():
            if key == str(producto.id):
                value["cantidad"] = value["cantidad"] - 1
                if value["cantidad"] < 1:
                    self.remove(producto)
                else:
                    self.save()
                break
            else:
                print("El producto no existe en el carrito")

    def clear(self):
        self.session["carrito"] = {}
        self.session.modified = True