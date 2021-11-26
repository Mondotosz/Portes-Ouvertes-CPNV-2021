document.getElementById("startCountdown").addEventListener("click", function () {

    const departMinutes = 10
    let temps = departMinutes * 60
    const timerElement = document.querySelector("#timer")

    var interval = setInterval(() => {
        let minutes = parseInt(temps / 60, 10)
        let secondes = parseInt(temps % 60, 10)

        minutes = minutes < 10 ? "0" + minutes : minutes
        secondes = secondes < 10 ? "0" + secondes : secondes
        timerElement.innerText = `${minutes}:${secondes}`
        temps = temps <= 0 ? 0 : temps - 1
        Alpine.store('timer', Math.floor(100 - (temps / 6)))


        let restMinutes = parseInt((600 - temps) / 60, 10)
        let restSecondes = parseInt((600 - temps) % 60, 10)

        restMinutes = restMinutes < 10 ? "0" + restMinutes : restMinutes
        restSecondes = restSecondes < 10 ? "0" + restSecondes : restSecondes
        Alpine.store('remainingTime', `${restMinutes}:${restSecondes}`)
        Alpine.store('restTimer', Math.floor(600 - temps))
        if (Alpine.store('clients').win) {
            clearInterval(interval);
            Alpine.store('showForm', true)
        }
    }, 1000)
    Alpine.store('timer', 0)

});

document.addEventListener('alpine:init', () => {
    Alpine.store('timer', 0)
    Alpine.store('restTimer', 0)
})

