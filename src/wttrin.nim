import strutils,
       strformat,
       httpclient,
       json

type
  Unit* = enum
    Farenheight = "F"
    Celcius = "C"

proc getTemprature*(httpclient: HttpClient, city: string = "", unit: Unit = Unit.Farenheight): int =
  ## Get the temprature of the city provided
  ## If no city is provided, detect the city based on current location
  var client = httpclient
  var weatherJson = parseJson getContent(client, fmt"https://wttr.in/{city}?format=j1")
  return weatherJson["current_condition"][0][fmt"temp_{unit}"].getStr().parseInt()

proc getFeelsLike*(httpclient: HttpClient, city: string = "", unit: Unit = Unit.Farenheight): int =
  ## Get the feels like temprature of the city provided
  ## If no city is provided, detect the city based on current location
  var client = httpclient
  var weatherJson = parseJson getContent(client, fmt"https://wttr.in/{city}?format=j1")
  return weatherJson["current_condition"][0][fmt"FeelsLike{unit}"].getStr().parseInt()



