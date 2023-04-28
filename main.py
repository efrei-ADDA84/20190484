
import os
import requests, json
from flask import Flask, request


app = Flask(__name__)
@app.route('/', methods=['GET'])
def get_weather():
    lat = request.args.get('lat')
    long = request.args.get('lon')
    API_KEY = os.getenv('API_KEY')

    if not (LAT and LONG and API_KEY):
        return None
    
    BASE_URL = "https://api.openweathermap.org/data/2.5/weather?"
  
    #URL
    URL = BASE_URL + "lat=" + lat +"&lon=" + long + "&appid=" + API_KEY

    # HTTP request
    response = requests.get(URL)

    if response.status_code == 200:
        weather_data = response.json()
        return weather_data
    else:
        return None

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8081)
