const { Server } = require("socket.io");
const port = 3000;
const { pingTarget } = require("./ping.js");
const targets = [{
    ip: "10.229.33.39",
    client: {
        name: "PC1", status: null
    }
},
{
    ip: "10.229.33.37",
    client: {
        name: "PC2", status: null
    }
},
{
    ip: "10.229.33.31",
    client: {
        name: "PC3", status: null
    }
}]


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

}, 3000);
