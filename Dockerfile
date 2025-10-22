# Imagen base ligera
FROM python:3.12-slim

# Evitar prompts interactivos y mejorar logs
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    FLASK_APP=app.py \
    FLASK_RUN_HOST=0.0.0.0 \
    FLASK_RUN_PORT=5000

WORKDIR /app

# Instalar dependencias del sistema (opcional, útil si agregas más libs)
RUN apt-get update && apt-get install -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Copiar requirements e instalar
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copiar el resto del código
COPY . .

EXPOSE 5000

# Ejecutar con el servidor de desarrollo de Flask
# Para producción podrías usar gunicorn: `CMD ["gunicorn","-w","2","-b","0.0.0.0:5000","app:app"]`
CMD ["flask", "run"]
