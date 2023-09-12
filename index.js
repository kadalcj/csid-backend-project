import express from 'express'
import dotenv from 'dotenv'
// import { PrismaClient } from '@prisma/client'

const app = express()
// const prisma = new PrismaClient()

dotenv.config()
const port = process.env.PORT

/**Root Route */
app.get('/', (_, res) => {
    res.send('Root')
})

/**Listen on port */
app.listen(port, () => {
    console.log(`Listen on port ${port}`)
})