const express = require("express")
const app = express()
const PORT = 3001
const { PrismaClient } = require('@prisma/client')
// import  from '@prisma/client'
const prisma = new PrismaClient()
// {log:["query"]}

app.use(express.json())

app.post("/", async (req, res) => {
   const newUser = await prisma.person.create({
      data: {
         name: "abomba",
         email: "abomba",
         password: "abomba"
      }
   })
   console.log(newUser);
   res.json(newUser)
})
app.get("/", async (req, res) => {
   const search = "Ay"
   const newUser =  await prisma.person.findMany({
      where:{
         name: { contains : search}
      }
   })
   console.log(newUser);
   res.json({ length : newUser.length, newUser })
})

// query on relATIONships

// include,select,createmany,create,findUnique,findfirst,take,skip,orderby,where{in,not,equals,contains,notin,endwiths, startwith}
// to use AND,NOT etc, you put the parameters in an array

app.listen(PORT, () => console.log(`server is running on port ${PORT}`))