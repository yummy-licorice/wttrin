import ../src/wttrin, unittest, httpclient

let c = newHttpClient()

echo c.getTemp("Plano")