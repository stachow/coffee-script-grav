sys = require("sys")
http = require("http")

# Create our HTTP server.
server = http.create( 
  (request, response) -> 
    response.writeHead(200, "content-type": "text/plain")
    response.write("Hello world")
    response.end()
    return
)

# Point the HTTP server to port 8080.
server.listen(8080)

# For logging....
sys.puts("Server is running on 8080")

