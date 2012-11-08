// Generated by CoffeeScript 1.4.0
var http, server, sys;

sys = require("sys");

http = require("http");

server = http.createServer(function(request, response) {
  response.writeHead(200, {
    "content-type": "text/plain"
  });
  response.write("Hello world\n");
  response.end();
});

server.listen(8080);

sys.puts("Server is running on 8080");
