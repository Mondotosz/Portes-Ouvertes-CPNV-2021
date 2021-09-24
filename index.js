const { Server } = require("socket.io");
const port = 3000;
const { pingTarget } = require("./ping.js");
const targets = require("./targets.json")


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
