const { Server } = require("socket.io");
const port = 3000;
const { pingTarget } = require("./ping.js");
const targets = require("./targets.json")

const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const tl = require('express-tl')

app.engine('tl', tl)
app.set('views', './views') // specify the views directory
app.set('view engine', 'tl') // register the template engine
app.use("/", express.static(__dirname));

app.get('/', (req, res) => {
    res.render('index',{

    })
});

server.listen(80, () => {
  console.log('listening on http://localhost:80');
});

const io = new Server(port, {
    cors: {
        origin: "*",
        methods: ["GET", "POST"]
    }
});

io.on("connection", (socket) => {
    setTimeout(() => {
        targets.forEach(target=>{
            socket.emit('new client', target.client)
        })
    }, 500)
});

var t = setInterval(() => {

    targets.forEach(target=>{

        promise = pingTarget(target.ip)
    
        promise.then((value) => {
            io.emit('update client', { name: target.client.name, status: value.alive })
        })
    })

}, 500);
