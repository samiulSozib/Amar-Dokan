const db = require('../model/database')
const DokanStaff = db.dokanStaff
const bcrypt = require('bcrypt')


exports.addDokanStaff = async(req, res, next) => {
    try {
        let { staffName, phone, password } = req.body
        let dokanId = req.dokanId
        console.log(dokanId)
        const staff = await DokanStaff.findAll({
            where: {
                phone: phone,
                status: '1'
            }
        })
        if (staff.length > 0) {
            return res.status(400).json({ msg: 'Staff Already Exists' })
        }

        const hashPassword = await bcrypt.hash(password, 10)
        const newStaff = await DokanStaff.create({
            dokanId,
            staffName,
            phone,
            password: hashPassword,
            status: '1'
        })

        if (newStaff) {
            return res.status(200).json({ msg: 'Staff create success' })
        } else {
            return res.status(400).json({ msg: 'Staff create fail ' })

        }

    } catch (e) {
        return res.status(500).json({ msg: e.message })
    }
}


exports.getAllStaff = async(req, res, next) => {
    try {
        let dokanId = req.dokanId
        let allStaff = await DokanStaff.findAll({
            where: {
                dokanId: dokanId
            }
        })
        return res.status(200).json({ allStaff })
    } catch (e) {
        return res.status(500).json({ msg: e.message })
    }
}