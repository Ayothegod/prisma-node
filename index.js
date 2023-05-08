const express = require("express")
const app = express()
const PORT = 3001
const { PrismaClient } = require('@prisma/client')
// import  from '@prisma/client'

const prisma = new PrismaClient()

app.get("/",(req,res) => {
    const allUsers = prisma.user.findMany()
    res.json(allUsers)
})

app.listen(PORT,() => console.log(`server is running on port ${PORT}`))