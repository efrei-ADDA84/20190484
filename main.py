from flask import Flask, request
import os
import requests

app = Flask(__name__)

@app.route('/', methods=['GET'])
def get_weather():
    lat = request.args.get('lat')
    lon = request.args.get('lon')
    API_KEY = os.getenv('API_KEY')

    if not (lat and lon and API_KEY):
        return None

    BASE_URL = "https://api.openweathermap.org/data/2.5/weather?"

    #URL
    URL = BASE_URL + "lat=" + lat +"&lon=" + lon + "&appid=" + API_KEY
    
    # HTTP request
    response = requests.get(URL)

    if response.status_code == 200:
        weather_data = response.json()
        return weather_data
    else:
        return "Error"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8081)
