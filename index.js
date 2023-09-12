import express from 'express'
import dotenv from 'dotenv'

/**Routes */
import deliveryRoute from './src/routes/delivery.route.js'
import stopRoute from './src/routes/stop.route.js'
import matrixRoute from './src/routes/matrix.route.js'

const app = express()

app.use(express.json())
dotenv.config()

const port = process.env.PORT

/**Root Route */
app.get('/', (_, res) => {
    res.send('Root')
})

/**Delivery */
app.use('/delivery', deliveryRoute)
/**Stop */
app.use('/stop', stopRoute)
/**Matrix */
app.use('/matrix', matrixRoute)

/**Listen on port */
app.listen(port, () => {
    console.log(`Listen on port ${port}`)
})