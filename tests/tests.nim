import ../src/wttrin, unittest, httpclient

const city = "Houston"
const unit = Farenheight
let c = newHttpClient()

echo c.getTemprature(city, unit)
echo c.getFeelsLike(city, unit)
