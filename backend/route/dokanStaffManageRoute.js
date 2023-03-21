const router = require('express').Router()
const adminAuth = require('../middleware/adminAuth')
const auth = require('../middleware/auth')
const { addDokanStaff, getAllStaff } = require('../controller/dokanStaffManageController')

router.post('/add', auth, addDokanStaff)
router.get('/', auth, getAllStaff)

module.exports = router