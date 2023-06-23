FROM python:3.9

# Définir le répertoire de travail dans le conteneur
WORKDIR /app
COPY . /app

# Installer les dépendances
RUN pip install -r requirements.txt

CMD ["python", "main.py"]

