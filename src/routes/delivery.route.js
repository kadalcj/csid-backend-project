import express from 'express'
import { PrismaClient } from '@prisma/client'

import utils from '../utils/utils.js'

const router = express.Router()
const prisma = new PrismaClient()


/** Delivery */
/** Get All Delivery */
router.get('/', async (_, res) => {
    try {
        const deliveries = await prisma.delivery.findMany({
            include: {
                stops: true,
                matrix: true
            }
        })

        res.status(200).json({
            'delivery': deliveries
        })
    } catch (_) {
        utils.responseError(res)
    }
})

/** Get Delivery by ID */
router.get('/:deliveryNumber', async (req, res) => {
    try {
        const delivery = await prisma.delivery.findFirst({
            where: {
                deliveryNumber: req.params.deliveryNumber
            },
            include: {
                stops: true,
                matrix: true
            }
        })

        res.status(200).json({
            'delivery': delivery
        })
    } catch (_) {
        utils.responseError(res)
    }
})

/** Create Delivery */
router.post('/', async (req, res) => {
    try {
        const delivery = await prisma.delivery.create({
            data: req.body
        })

        res.status(201).json({
            'message': 'Create Delivery Success!',
            'delivery': delivery
        })
    } catch (_) {
        utils.responseError(res)
    }
})

/** Update Delivery by ID*/
router.put('/:id', async (req, res) => {
    try {
        const delivery = await prisma.delivery.update({
            where: {
                id: req.params.id
            },
            data: req.body
        })

        res.status(200).json({
            'message': 'Update Delivery Success!',
            'delivery': delivery
        })
    } catch (_) {
        utils.responseError(res)
    }
})

/** Delete Delivery by ID */
router.delete('/:id', async (req, res) => {
    try {
        const delivery = await prisma.delivery.delete({
            where: {
                id: req.params.id
            }
        })

        res.status(200).json({
            'message': 'delete Delivery Success!',
            'delivery': delivery
        })
    } catch (_) {
        utils.responseError(res)
    }
})

export default router