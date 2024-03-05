from pymongo import MongoClient
import os

# Obtener la dirección IP y el puerto de MongoDB desde las variables de entorno
mongo_ip = os.environ.get("MONGO_IP")
mongo_port = os.environ.get("MONGO_PORT")

# Crear la cadena de conexión a MongoDB utilizando las variables de entorno
mongo_uri = f"mongodb://{mongo_ip}:{mongo_port}"

# Conectar con MongoDB
client = MongoClient(mongo_uri)
db = client['quacker']
users = db['users']
quacks = db['quacks']
