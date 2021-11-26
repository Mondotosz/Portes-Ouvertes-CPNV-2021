const config = require("./config.json");
const { Server } = require("socket.io");
const { pingTarget } = require("./ping.js");
const targets = require("./targets.json")

const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);

const tl = require('express-tl');
const { connected } = require("process");

const fs = require('fs');


app.engine('tl', tl)
app.set('views', './views') // specify the views directory
app.set('view engine', 'tl') // register the template engine
app.use("/", express.static(__dirname));

app.get('/', (req, res) => {
    res.render('index', {
        ip: config.ip,
        port: config.ioPort
    })
});

server.listen(config.httpPort, () => {
    console.log(`listening on http://${config.ip}:${config.httpPort}`);
});

const io = new Server(config.ioPort, {
    cors: {
        origin: "*",
        methods: ["GET", "POST"]
    }
});

io.on("connection", (socket) => {
    setTimeout(() => {
        targets.forEach(target => {
            socket.emit('new client', target.client)
        })
    }, 500)
});

var t = setInterval(() => {
    let connected = true;
    let promise;

    targets.forEach(target => {

        promise = pingTarget(target.ip)

        

        promise.then((value) => {
            io.emit('update client', { name: target.client.name, status: value.alive })
        })
    })


}, 500);

app.get('/scoreboard', (req, res) => {

    const user = {
        "firstname" : req.query.firstname,
        "lastname" : req.query.lastname,
        "timer" : req.query?.timer
    }

    let scoreboard = JSON.parse(fs.readFileSync("scoreboard.json", "utf-8"));
    scoreboard.push(user)
    const data = JSON.stringify(scoreboard);

    fs.writeFile('scoreboard.json', data, (err) => {
        if (err) {
            throw err;
        }
        console.log("JSON data is saved.");
    });

    res.send("This shoud be the scoreboard page!")
});

