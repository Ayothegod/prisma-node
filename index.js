const express = require("express")
const app = express()
const PORT = 3001

app.get("/",(req,res) => {
    res.status(200).json("hello")
})

app.listen(PORT,() => console.log(`server running on port ${PORT}`))