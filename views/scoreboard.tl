<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scoreboard</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="flex flex-col items-center justify-center min-h-screen px-12">
    <a href="/" class="fixed px-6 py-3 bg-blue-200 rounded-md top-10 left-10 hover:bg-blue-500 hover:text-white">Retour</a>
    <table class="rounded-md table-auto ring-2 ring-blue-500" x-data="scoreboard">
        <thead class="table-header-group rounded-t-md ring-2 ring-blue-500">
            <tr>
                <th class="p-2 text-xl font-medium">temps</th>
                <th class="p-2 text-xl font-medium">nom</th>
                <th class="p-2 text-xl font-medium">prenom</th>
            </tr>
        </thead>
        <tbody class="">
            <template x-for="(score, index) in scores">
                <tr :class="index % 2 == 0 ? 'bg-blue-300' : ''">
                    <td x-text="score.timer" class="p-1 px-2"></td>
                    <td x-text="score.lastname" class="p-1 px-2"></td>
                    <td x-text="score.firstname" class="p-1 px-2"></td>
                </tr>
            </template>
        </tbody>
    </table>
    <script src="/node_modules/alpinejs/dist/cdn.min.js" defer></script>
    <script src="/scoreboard.js"></script>
</body>

</html>