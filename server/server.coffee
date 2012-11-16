sys = require "sys"
http = require "http"

getIp = (req) ->
	if req.headers['x-forwarded-for'] 
		req.headers['x-forwarded-for']
	else
		req.connection.remoteAddress

# Create our HTTP server.
server = http.createServer (request, response) -> 
    response.writeHead 200, "content-type": "text/plain"
    response.write "Hello world\n"
    response.write getIp(request) + "\n"
    d = new Date
    response.write d.toLocaleDateString() + "\n"
    response.write d.toLocaleTimeString() + "\n"
    response.end()
    return
.listen 8080

# For logging....
sys.puts "Server is running on 8080"
