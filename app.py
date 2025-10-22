from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html", titulo="Inicio")

@app.route("/productos")
def productos():
    # Ejemplo de lista de productos (mock)
    lista = [
        {"id": 1, "nombre": "Teclado", "precio": 79.90},
        {"id": 2, "nombre": "Mouse", "precio": 49.50},
        {"id": 3, "nombre": "Monitor", "precio": 899.00},
    ]
    return render_template("productos.html", titulo="Productos", productos=lista)

if __name__ == "__main__":
    # Para ejecución directa (desarrollo)
    app.run(host="0.0.0.0", port=5000, debug=True)
