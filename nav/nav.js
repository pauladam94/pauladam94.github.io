const nav = document.querySelector(".nav")
fetch("/nav/nav.html")
.then(res=>res.text())
.then(data=> {
    nav.innerHTML=data
})