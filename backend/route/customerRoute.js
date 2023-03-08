const router = require('express').Router()
const { addCustomer } = require('../controller/customerController')
const auth = require('../middleware/auth')

router.post('/add-customer', auth, addCustomer)

module.exports = router