import strutils,
       strformat,
       httpclient,
       json

proc getTemp*(httpclient: HttpClient, city: string = ""): int =
  ## Get the temprature of the city provided
  ## If no city is provided, detect the city based on current location
  var client = httpclient
  var weatherJson = parseJson getContent(client, fmt"https://wttr.in/{city}?format=j1")
  return weatherJson["current_condition"][0]["temp_F"].getStr().parseInt()

## Get the weather condition as an emoji
proc getCondition*(city: string = ""): string =
  var client = newHttpClient()
  var weather = $getContent(client ,fmt"https://wttr.in/{city}?format=1")
  return weather.split("+")[0].strip()

## Get the unit of the weather
## Either "C" or "F" for celcius or fahrenheit
proc getUnit*(city: string = ""): char =
  var client = newHttpClient()
  var weather = $getContent(client ,fmt"https://wttr.in/{city}?format=1")
  if "F" in weather:
    return 'F'
  else:
    return 'C'


