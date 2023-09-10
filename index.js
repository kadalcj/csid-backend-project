import express from 'express'

const app = express()
const port = 6969

app.get('/', (_, res) => {
    res.send('Root')
})

app.listen(port, () => {
    console.log(`Listen on port ${port}`)
})