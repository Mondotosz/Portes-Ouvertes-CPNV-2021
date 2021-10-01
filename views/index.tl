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
    <div x-data="{}" class="grid grid-cols-4 gap-6">
        <template x-for="client in $store.clients.clients">            
            <div x-data="connection(client)" class="flex items-center px-6 py-2 space-x-6 bg-gray-100 rounded-md">
                <div x-bind:class="status" class="w-8 h-8 rounded-full"></div>
                <div x-text="client.name" class="text-4xl font-semibold align-middle select-none">PCX</div>
            </div>
        </template>
    </div>
    <script src="node_modules/socket.io-client/dist/socket.io.min.js"></script>
    <script src="node_modules/alpinejs/dist/cdn.min.js" defer></script>
    <script src="components.js"></script>
</body>

</html>