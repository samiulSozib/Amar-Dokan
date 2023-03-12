const router = require('express').Router()
const { createTransaction, getTransactionHistory, getTotalUnpaidTransaction } = require('../controller/transactionController')
const auth = require('../middleware/auth')

router.post('/create', auth, createTransaction)
router.get('/history/:dokanId/:customerId', auth, getTransactionHistory)
router.get('/all-unpaid', auth, getTotalUnpaidTransaction)
    // router.get('/months', auth, getEveryMonthTransaction)


module.exports = router