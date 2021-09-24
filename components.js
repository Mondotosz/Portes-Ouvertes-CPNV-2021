document.addEventListener("alpine:init", () => {

    Alpine.store('clients', {
        clients: [],
        add(newClient) {
            if (this.clients.map(client => client.name).indexOf(newClient.name) == -1) {
                this.clients.push(newClient)
            }
        },
        update(updatedClient) {
            this.clients[this.clients.map(client => client.name).indexOf(updatedClient.name)] = updatedClient;
        }
    })


    Alpine.data('connection', (client) => ({
        client: client,
        connected: null,
        init() {
            if (client) {
                setInterval(() => {
                    this.connected = Alpine.store('clients').clients[Alpine.store('clients').clients.map(c => c.name).indexOf(this.client.name)].status
                }, 500)
            }
        },
        get status() {
            return this.connected == null ? 'bg-gray-400' : (this.connected ? 'bg-green-500' : 'bg-red-500');
        },
        debug: {
            ['@click']() {
                this.connected = !this.connected;
            }
        }
    }))
})

const socket = io("http://localhost:3000")

socket.on("new client", (client) => {
    Alpine.store('clients').add(client)
})

socket.on("update client", (client) => {
    Alpine.store('clients').update(client)
})