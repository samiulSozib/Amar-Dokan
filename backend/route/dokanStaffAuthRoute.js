const router = require('express').Router()
const { signInDokanStaff } = require('../controller/dokanStaffAuthController')


router.post('/signin', signInDokanStaff)

module.exports = router