const router = require('express').Router()
const adminAuth = require('../middleware/adminAuth')
const { addDokanStaff } = require('../controller/dokanStaffManageController')

router.post('/add', adminAuth, addDokanStaff)

module.exports = router