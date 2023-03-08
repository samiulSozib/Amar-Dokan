const db = require('../model/database')
const Customer = db.customer

exports.addCustomer = async(req, res, next) => {
    try {
        let { customerName, customerPhone, customerAddress } = req.body
        let dokanId = req.dokanId

        const customer = await Customer.findAll({
            where: {
                customerPhone: customerPhone,
                status: '1'
            }
        })
        if (customer.length > 0) {
            return res.status(400).json({ msg: 'Customer Already Exists' })
        }


        const newCustomer = await Customer.create({
            dokanId,
            customerName,
            customerPhone,
            customerAddress,
            status: '1'
        })

        if (newCustomer) {
            return res.status(200).json({ msg: 'Customer create success' })
        } else {
            return res.status(400).json({ msg: 'Customer create fail ' })

        }

    } catch (e) {
        return res.status(500).json({ msg: 'something wrong' })
    }
}