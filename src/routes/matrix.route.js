import express from 'express'
import { PrismaClient } from '@prisma/client'

import utils from '../utils/utils.js'

const route = express.Router()
const prisma = new PrismaClient()

/** Matrix */
/** #GET All Matrix by Deliver ID */
route.get('/:id', async (req, res) => {
    try {
        const matrix = await prisma.matrix.findMany({
            where: {
                deliveryId: req.params.id
            }
        })

        res.status(200).json({
            'matrix': matrix
        })
    } catch (_) {
        utils.responseError(res)

    }
})

/** Create Matrix */
route.post('/', async (req, res) => {
    try {
        const matrix = await prisma.matrix.create({
            data: req.body
        })

        res.status(201).json({
            'matrix': matrix
        })
    } catch (_) {
        utils.responseError(res)

    }
})

/** Update Matrix */
route.put('/:id', async (req, res) => {
    try {
        const matrix = await prisma.matrix.update({
            where: {
                id: req.params.id
            },
            data: req.body
        })

        res.status(200).json({
            'message': 'update matrix success!',
            'matrix': matrix
        })
    } catch (_) {
        utils.responseError(res)

    }
})

/** Delete Matrix */
route.delete('/:id', async (req, res) => {
    try {
        const matrix = await prisma.matrix.delete({
            where: {
                id: req.params.id
            },
        })

        res.status(200).json({
            'message': 'delete matrix success!',
            'matrix': matrix
        })
    } catch (_) {
        utils.responseError(res)

    }
})

export default route