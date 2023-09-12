/** Utils */
const responseError = (res) => {
    res.status(500).json({
        'message': 'something went wrong!'
    })
}

export default {
    responseError
}