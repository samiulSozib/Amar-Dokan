const { sequelize } = require('../model/database')
const db = require('../model/database')
const Transaction = db.transaction
const Customer = db.customer
const DokanStaff = db.dokanStaff

exports.createTransaction = async(req, res, next) => {
    try {
        let { dokanId, customerId, transactionAmount, notes, type } = req.body
        let dokanStaffId
        if (req.userType == 'dokanAdmin') {
            dokanStaffId = null;
        } else {
            dokanStaffId = req.userId
        }

        let customer = await Customer.findOne({
            where: {
                id: customerId,
                dokanId: dokanId
            }
        })

        let currentAmount = customer.totalAmount

        if (type == 'add') {
            currentAmount += transactionAmount

        } else if (type == 'remove') {
            currentAmount -= transactionAmount
            transactionAmount = transactionAmount * (-1)
        }




        await sequelize.transaction(async(t) => {
            await Customer.update({
                totalAmount: currentAmount
            }, {
                where: {
                    id: customerId,
                    dokanId: dokanId,
                }
            })

            await Transaction.create({
                dokanId,
                customerId,
                dokanStaffId,
                transactionAmount,
                notes
            })

            res.status(200).json({ msg: 'success' })
        })




    } catch (e) {
        return res.status(500).json({ msg: 'Something Wrong' })
    }
}


exports.getTransactionHistory = async(req, res, next) => {
    try {
        let { dokanId, customerId } = req.params

        await sequelize.transaction(async(t) => {
            let allTransaction = await Customer.findOne({
                    where: {
                        dokanId: dokanId,
                        id: customerId
                    },
                    include: [{ model: Transaction, include: [{ model: DokanStaff }] }]
                })
                //res.status(200).json({ status: 200, transaction: allTransaction })
            res.status(200).json(allTransaction)

        })





    } catch (e) {
        console.log(e)
        return res.status(500).json({ msg: 'Something Wrong' })
    }
}