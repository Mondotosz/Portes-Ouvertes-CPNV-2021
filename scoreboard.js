document.addEventListener("alpine:init",()=>{

    Alpine.data("scoreboard",()=>({
        scores : [],
        init(){
            this.update()
            setInterval(()=>{
                this.update()
                console.log(this.scores)
            },1000)
        },
        update(){
            fetch("/scoreboard.json")
            .then(response => {
                return response.json()
            }).then(data=>{
                this.scores = data.sort((a,b)=>{return a.timer > b.timer})
            })
        }
    }))
})