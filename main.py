
import os
import requests, json

def get_weather():
    LAT = os.getenv('LAT')
    LONG = os.getenv('LONG')
    API_KEY = os.getenv('API_KEY')

    if not (LAT and LONG and API_KEY):
        return None
    
    BASE_URL = "https://api.openweathermap.org/data/2.5/weather?"
  
    #URL
    URL = BASE_URL + "lat=" + LAT +"&lon=" + LONG + "&appid=" + API_KEY
    
    # HTTP request
    response = requests.get(URL)

    if response.status_code == 200:
        weather_data = response.json()
        return weather_data
    else:
        return None

if __name__ == '__main__':
    response = get_weather()
    print(response)
