# TP2

Voir la branche TP2.
Utiliser Github action pour build et push l’image à chaque nouveau commit.

En utilisant la commande suivante il est possible d'avoir l'API qui renvoie la météo :

` docker run --network host --env API_KEY=f533aa1341045b36b24d64cd972e3d4e meliwgg/weather:latest ` 

Puis dans un autre terminal : 

` curl "http://localhost:8081/?lat=5.902785&lon=102.754175" `
