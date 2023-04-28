# Projet Weather

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

LAT: la latitude du lieu souhaité
LONG: la longitude du lieu souhaité
API_KEY: la clé API OpenWeather
