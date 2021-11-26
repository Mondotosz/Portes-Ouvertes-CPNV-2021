<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>>_</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="flex flex-col items-center justify-center min-h-screen px-12">
    <div x-data="{form : false}" x-transition:leave.duration.500ms x-transition:leave.origin.bottom>
        <div x-show="!$store.showForm" class="grid grid-cols-4 gap-6">
            <template x-for="client in $store.clients.clients">
                <div x-data="connection(client)" class="flex items-center px-6 py-2 space-x-6 bg-gray-100 rounded-md">
                    <div x-bind:class="status" class="w-8 h-8 rounded-full"></div>
                    <div x-text="client.name" class="text-4xl font-semibold align-middle select-none">PCX</div>
                </div>
            </template>
        </div>    
        <div x-cloak x-show="$store.showForm" x-transition:enter.duration.500ms x-transition:enter.origin.top>
            <div id="confetti-holder"
                class="flex flex-col items-center w-auto px-6 py-4 m-8 border-2 border-gray-500 rounded-lg h-72">
                <bold class="font-bold">Bravo, vous avez sauvé l'infrastructure ! </bold><br>
                <div x-text="$store.remainingTime"></div>
                <form method="get" class="form-example" action="/scoreboard">
                    <label>Nom</label>
                    <input class="w-full p-1 border-2 border-gray-400 rounded-md" type="text" name="lastname">
                    <label>Prénom</label>
                    <input class="w-full p-1 border-2 border-gray-400 rounded-md" type="text" name="firstname">
                    <div class="flex items-center justify-center mt-5 ">
                        <input class="px-5 bg-gray-200 rounded-md" type="submit" value="Terminer">
                    </div>
                    <input :value="$store.remainingTime" type="hidden" name="timer" value="00:00"/>
                </form>
            </div>
        </div>
    </div>

    <div class="">
        <div id="timer" class="flex flex-row justify-center text-4xl font-semibold ">
            <div x-show="open">
                10:00
            </div>
        </div>

    </div>

    <div class="flex flex-row w-2/3">

        <svg xmlns="http://www.w3.org/2000/svg" class="w-8 h-8 mt-3" fill="none" viewBox="0 0 24 24"
            stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M20.618 5.984A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016zM12 9v2m0 4h.01" />
        </svg>

        <div class="w-full px-16">
            <div class="" x-data="{ width: '23' }"
                x-init="$watch('width', value => { if (value > 100) { width = 100 } if (value == 0) { width = 10 } })">
                <div class="h-6 mt-5 bg-gray-300 rounded" role="progressbar" :aria-valuenow="width" aria-valuemin="0"
                    aria-valuemax="100">
                    <div class="h-6 text-sm text-center text-white transition bg-red-800 rounded"
                        :style="'width: '+ $store.timer + '%; transition: width 2s;'" x-text="$store.timer + '%'">
                    </div>
                </div>
            </div>
        </div>

        <svg xmlns="http://www.w3.org/2000/svg" class="w-8 h-8 mt-3" viewBox="0 0 24 24">
            <path
                d="M12 2c5.514 0 10 4.486 10 10s-4.486 10-10 10-10-4.486-10-10 4.486-10 10-10zm0-2c-6.627 
        0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm4.382 11.188c-.347.26-.769.401-1.202.401-.804 
        0-1.207-.981-.641-1.547.307-.308.703-.505 1.133-.566.811-.117 1.167-1.122.571-1.718s-1.602-.24-1.718.571c-.062.429-.26.827-.566 
        1.133-.569.569-1.547.165-1.547-.641 0-.435.14-.854.401-1.202.49-.657.029-1.619-.813-1.619-.841 0-1.303.962-.812 1.619.26.347.401.768.401 
        1.202 0 .805-.978 1.21-1.547.641-.308-.308-.505-.704-.566-1.134-.117-.81-1.122-1.167-1.719-.571s-.24 1.602.571 1.718c.429.062.827.26 
        1.133.566.569.569.165 1.547-.641 1.547-.435 0-.854-.14-1.202-.401-.656-.49-1.618-.029-1.618.813 0 .841.962 1.303 1.619.812.347-.26.768-.401 
        1.202-.401.805 0 1.21.978.641 1.547-.307.308-.703.505-1.133.566-.811.117-1.167 1.122-.571 1.718s1.602.24 1.718-.571c.062-.429.26-.827.566-1.133.569-.569 
        1.547-.165 1.547.641 0 .435-.14.854-.401 1.202-.49.656-.032 1.619.812 1.619.839 0 1.306-.959.811-1.62-.259-.344-.4-.764-.4-1.194 0-.808.978-1.216 
        1.547-.647.308.307.505.703.566 1.133.117.811 1.122 1.167 1.718.571.595-.595.242-1.603-.573-1.718-.427-.061-.823-.258-1.127-.562-.571-.571-.168-1.551.637-1.551.435 
        0 .854.14 1.202.401.656.489 1.619.031 1.619-.813 0-.843-.963-1.303-1.618-.812zm-5.364 2.149c-.273 
        0-.495-.222-.495-.495s.222-.495.495-.495.495.222.495.495-.222.495-.495.495zm.63-1.572c-.429 0-.776-.348-.776-.777 0-.429.348-.776.776-.776.429 0 
        .777.348.777.776 0 .429-.347.777-.777.777zm1.464 1.484c-.363 0-.658-.294-.658-.657s.294-.658.658-.658.658.295.658.658-.294.657-.658.657z" />
        </svg>
    </div>

    <div
        class="absolute left-0 bottom-auto right-auto w-full h-full transition-all bg-green-400 -top-full transition-0">

    </div>

    <div>
        <div x-data="{open : true}" class="flex justify-center mt-12">
            <button @click="open = ! open" id="startCountdown" class="p-1">
                <div x-show="open">
                    <div class="flex items-center px-6 py-2 space-x-6 bg-gray-200 rounded-md">
                        <div class="text-4xl font-semibold align-middle select-none">Commencer</div>
                    </div>
                </div>
            </button>
            <!-- <button @click="form = ! form" id="stopCountdown" class="p-1">
                <div x-show="!open && !$store.showForm" x-transition>
                    <div class="flex items-center px-6 py-2 space-x-6 bg-gray-200 rounded-md">
                        <div class="text-4xl font-semibold align-middle select-none">Arreter</div>
                    </div>
                </div>
            </button> -->
        </div>
    </div>
    <script src="node_modules/socket.io-client/dist/socket.io.min.js"></script>
    <script src="node_modules/alpinejs/dist/cdn.min.js" defer></script>
    <script src="components.js"></script>
    <script src="timer.js"></script>
    <script src="node_modules/confetti-js/dist/index.min.js"></script>
    <script>
        const socket = io("http://${d.ip}:${d.port}")

        socket.on("new client", (client) => {
            Alpine.store('clients').add(client)
        })

        socket.on("update client", (client) => {
            Alpine.store('clients').update(client)
        })

    </script>
</body>

</html>