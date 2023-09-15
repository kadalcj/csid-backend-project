import express from 'express'
import { PrismaClient } from '@prisma/client'

import utils from '../utils/utils.js'

const route = express.Router()
const prisma = new PrismaClient()

/** Stop */
/** GET All Stop by Delivery ID */
route.get('/:id', async (req, res) => {
    try {
        const stops = await prisma.stop.findMany({
            where: {
                deliveryId: req.params.id
            }
        })

        res.status(200).json({
            'stops': stops
        })
    } catch (_) {
        utils.responseError(res)
    }
})

/** Create Stop */
route.post('/', async (req, res) => {
    try {
        const stop = await prisma.stop.create({
            data: req.body
        })

        res.status(201).json({
            'stop': stop
        })
    } catch (err) {
        console.error(err);
        utils.responseError(res)
    }
})

/** Update Stop */
route.put('/:id', async (req, res) => {
    try {
        const stop = await prisma.stop.update({
            where: {
                id: req.params.id
            },
            data: req.body
        })

        res.status(200).json({
            'message': 'update stop success!',
            'stop': stop
        })
    } catch (_) {
        utils.responseError(res)
    }
})

/** Delete Stop */
route.delete('/:id', async (req, res) => {
    try {
        const stop = await prisma.stop.delete({
            where: {
                id: req.params.id
            }
        })

        res.status(200).json({
            'message': 'delete stop success!',
            'stop': stop
        })
    }  catch (_) {
        utils.responseError(res)
    }
})

export default route