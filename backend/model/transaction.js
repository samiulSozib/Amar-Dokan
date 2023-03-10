module.exports = (sequelize, DataTypes) => {
    const Transaction = sequelize.define('transactions', {
        dokanId: {
            type: DataTypes.INTEGER
        },
        customerId: {
            type: DataTypes.INTEGER
        },
        dokanStaffId: {
            type: DataTypes.INTEGER
        },
        transactionAmount: {
            type: DataTypes.DOUBLE,
        },
        notes: {
            type: DataTypes.STRING
        }

    }, {
        timestamps: true
    })
    return Transaction
}