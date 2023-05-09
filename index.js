const express = require("express")
const app = express()
const PORT = 3001
const { PrismaClient } = require('@prisma/client')
// import  from '@prisma/client'
const prisma = new PrismaClient()

app.use(express.json())

app.get("/", async (req, res) => {
    const allUsers = await prisma.user.findMany()
    res.json(allUsers)
})

app.post("/", async (req, res) => {
    const newUser = await prisma.user.create({ data: req.body })
    res.json(newUser)
})

app.put("/:id", async (req, res) => {
    const id = req.params.id
    // const newAge = req.body.age
    const newUser = await prisma.user.update(
        {
            where: { id: parseInt(id) },
            data: { age: req.body.age }
        }
    )
    res.json(newUser)
})

app.listen(PORT, () => console.log(`server is running on port ${PORT}`))