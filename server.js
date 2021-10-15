const http = require('http');

const hostname = '10.229.33.32';
const port = 3000;

const { pingTarget } = require("./ping.js");

const server = http.createServer((req, res) => {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');

    var t = setInterval(() => {

        promise = pingTarget("10.229.33.132")

        promise.then((value) => {
            res.end(value.host + " is " + value.alive);
            console.log(value.host + " is " + value.alive)
        })

    }, 3000);
});

server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
});