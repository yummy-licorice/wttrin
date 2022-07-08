import strutils,
       strformat,
       httpclient

## Return the temprature of the given city, 
## if no city is given, return the weather for the current location
proc getTemp*(city: string = ""): int =
  var client = newHttpClient()
  var weather = $getContent(client ,fmt"https://wttr.in/{city}?format=1")
  return weather.split("+")[1].strip().split("°")[0].strip().parseInt()

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


