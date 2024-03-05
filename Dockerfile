# Fase 1: Instalación de dependencias
FROM python:3.11-slim AS builder

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el archivo de requerimientos
COPY requirements.txt .

# Instalar las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Fase 2: Ejecución de la aplicación
FROM builder

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar solo los archivos necesarios de la fase anterior
COPY app.py .
COPY model ./model
COPY service ./service
COPY static ./static
COPY templates ./templates
COPY dao ./dao
COPY mongo.py .

# Exponer el puerto en el que se ejecuta la aplicación
EXPOSE 5000

# Establecer las variables de entorno necesarias
ENV MONGO_IP="mongodb"
ENV MONGO_PORT="27017"

# Comando para ejecutar la aplicación
CMD python ./app.py
