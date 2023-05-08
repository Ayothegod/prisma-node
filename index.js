const express = require("express")
const app = express()
const PORT = 3001
// import { PrismaClient } from '@prisma/client'
// const prisma = new PrismaClient()

app.get("/",(req,res) => {
    res.status(200).json("Hello")
})

app.listen(PORT,() => console.log(`server is running on port ${PORT}`))