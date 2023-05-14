const express = require("express")
const app = express()
const PORT = 3001
const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
// {log:["query"]}

app.use(express.json())

app.post("/", async (req, res) => {
   const newUser = await prisma.logInfo.create({
      // data: {
      //    name: 'fif new',
      //    email: "secjksjkjksdond new",
      // }
      data: {
         password: "jkdjkjksdjksd",
         userId:"aef329ac-16e0-4135-904e-9ea46b7c0e35"
      }
   })
   res.json(newUser)
})

app.get("/", async (req, res) => {
   // await prisma.post.deleteMany()
   const newUser = await prisma.logInfo.findMany()
   res.json({ total: newUser.length, newUser })
})

app.delete("/:id", async (req, res) => {
   const id = req.params.id
   const newUser = await prisma.user.delete({
      where: {
         id: id
      }
   })
   res.json(newUser)
})

// include,select,createmany,create,findUnique,findfirst,take,skip,orderby,where{in,not,equals,contains,notin,endwiths, startwith}
// to use AND,NOT etc, you put the parameters in an array

app.listen(PORT, () => console.log(`server is running on port ${PORT}`))