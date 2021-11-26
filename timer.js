document.getElementById("startCountdown").addEventListener("click", function(){

    const departMinutes = 10
    let temps = departMinutes * 60
    const timerElement = document.querySelector("#timer")
    const restTimerElement = document.querySelector("#restTimer")

    var interval = setInterval(() =>{
        let minutes = parseInt(temps / 60, 10)
        let secondes = parseInt(temps % 60, 10)

        minutes = minutes < 10 ? "0" + minutes : minutes
        secondes = secondes < 10 ? "0" + secondes : secondes
        timerElement.innerText = `${minutes}:${secondes}`
        temps = temps <= 0 ? 0 : temps - 1
        Alpine.store('timer', Math.floor(100 - (temps / 6)))


        let restMinutes = parseInt((600 -temps) / 60, 10)
        let restSecondes = parseInt((600 -temps) % 60, 10)

        restMinutes = restMinutes < 10 ? "0" + restMinutes : restMinutes
        restSecondes = restSecondes < 10 ? "0" + restSecondes : restSecondes
        restTimerElement.innerText = `${restMinutes}:${restSecondes}`
        Alpine.store('restTimer', Math.floor(600 - temps))
    }, 1000)
    Alpine.store('timer' , 0)
    

    socket.on("loadForm",()=>{
        clearInterval(interval);
        Alpine.store('showForm',true)
    })

});

document.addEventListener('alpine:init', () => {
    Alpine.store('timer', 0)
    Alpine.store('restTimer', 0)
})

