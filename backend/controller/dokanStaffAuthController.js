const db = require('../model/database')
const DokanStaff = db.dokanStaff
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')

exports.signInDokanStaff = async(req, res, next) => {
    try {
        let { phone, password } = req.body
        const staff = await DokanStaff.findOne({
            where: {
                phone: phone
            }
        })
        if (!staff) {
            return res
                .status(400)
                .json({ msg: "User with this phone does not exist!" });
        }

        const isMatch = await bcrypt.compare(password, staff.password)
        console.log(isMatch)
        if (!isMatch) {
            return res.status(400).json({ msg: "Incorrect password." });
        }

        const token = jwt.sign({ id: staff.id, type: 'staff' }, "tokenSecretKey")
            //const token = jwt.sign({ staff }, "tokenSecretKey")
        return res.status(200).json({ token })
            //return res.status(200).json({ token })

    } catch (e) {
        res.status(500).json({ error: e.message })
    }
}