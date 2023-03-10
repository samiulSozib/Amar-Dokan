const router = require('express').Router()
const { createTransaction, getTransactionHistory } = require('../controller/transactionController')
const auth = require('../middleware/auth')

router.post('/create', auth, createTransaction)
router.get('/history/:dokanId/:customerId', auth, getTransactionHistory)


module.exports = router