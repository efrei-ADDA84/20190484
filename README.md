# Projet Weather

# TP1

Voir branche main
Ce projet permet de récupérer la météo d'un lieu donné en utilisant l'API OpenWeather. Le lieu doit être défini par sa latitude et sa longitude passées en variable d'environnement.

## Prérequis

- Docker
- Clé API OpenWeather

## Utilisation

Pour utiliser ce projet, suivez les étapes suivantes :

1. Clonez le projet depuis Github
`git clone https://github.com/efrei-ADDA84/20190484.git`
2. Construisez l'image Docker en utilisant la commande 
`docker build -t meliwgg/weather:1.0 .`
3. Lancez le conteneur en utilisant la commande 
`docker run --env LAT= <latitude> --env LONG= <longitude> --env API_KEY=<votre clé api> meliwgg/weather:1.0  `

## Variables d'environnement

- LAT: la latitude du lieu souhaité
- LONG: la longitude du lieu souhaité
- API_KEY: la clé API OpenWeather

# TP2

Voir la branche TP2.
Utiliser Github action pour build et push l’image à chaque nouveau commit.

En utilisant la commande suivante il est possible d'avoir l'API qui renvoie la météo :

` docker run --network host --env API_KEY=f533aa1341045b36b24d64cd972e3d4e meliwgg/weather:latest ` 

Puis dans un autre terminal : 

` curl "http://localhost:8081/?lat=5.902785&lon=102.754175" `


# TP3

Voir la branche TP3.
Utiliser Github action pour mettre à disposition notre image (format API) sur Azure Container Registry (ACR) en utilisant Github Actions et déployer sur Azure Container Instance (ACI)

API qui renvoie la météo en utilisant la commande suivante :

` curl "http://devops-20190484.westeurope.azurecontainer.io:8081/?lat=5.902785&lon=102.754175" `
