const header = document.querySelector("header")
fetch("./header/header.html")
.then(res=>res.text())
.then(data=> {
    header.innerHTML=data
})

const nav = document.querySelector("nav")
fetch("./nav/nav.html")
.then(res=>res.text())
.then(data=> {
    nav.innerHTML=data
})

const footer = document.querySelector("footer")
fetch("./footer/footer.html")
.then(res=>res.text())
.then(data=> {
    footer.innerHTML=data
})