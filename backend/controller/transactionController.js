const db = require('../model/database')
const Transaction = db.transaction

exports.createTransaction = async(req, res, next) => {
    try {

    } catch (e) {
        return res.status(500).json({ msg: 'Something Wrong' })
    }
}