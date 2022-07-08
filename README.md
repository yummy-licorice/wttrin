# wttrin
### A small nim library that fetches weather from wttr.in
#### IMPORTANT: if you use this library in your code you will need to build your nim project with the ssl flag 
```bash
nim c -r -d:ssl <filename>
```

## Usage
#### getTemp()
The first (and most used) function is `getTemp()`</br>
This function has an optional parameter `city` which should be a city in lowercase</br>
If the city parameter isn't provided it defaults to using your current location</br>
```nim
import wttrin

echo getTemp
```
#### getCondition()
Another function, 'getCondition()', can be used to get the weather condition as an emoji
```nim
import wttrin

echo getCondition
```
#### getUnit
The final function, 'getUnit()', can be used to get the current unit of weather
```nim
import wttrin

echo getUnit
```
