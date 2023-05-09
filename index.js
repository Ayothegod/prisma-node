const express = require("express")
const app = express()
const PORT = 3001
const { PrismaClient } = require('@prisma/client')
// import  from '@prisma/client'
const prisma = new PrismaClient()

app.use(express.json())

app.get("/", async (req, res) => {
    const allUsers = await prisma.person_loginfo.findMany()
    res.json(allUsers)
})
app.get("/:id", async (req, res) => {
    const id = req.params.id
    const newUser = await prisma.person_loginfo.findUnique({
        where: {
          id: parseInt(id),
        },
        include: {
            person: true,
        },
      })
    res.json(newUser)
})

// app.post("/", async (req, res) => {
//     const person = await prisma.person.create({ data: req.body })
//     res.json(person)
// })

//create person_info
app.post("/", async (req, res) => {
    const person_info = await prisma.person_loginfo.create({ data: req.body })
    res.json(person_info)
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