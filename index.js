const express = require("express")
const app = express()
const PORT = 3001

app.get("/",(req,res) => {
    res.status(200).json({"hello":"hii"})
})

app.listen(PORT,() => console.log(`server is running on port ${PORT}`))