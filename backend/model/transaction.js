module.exports = (sequelize, DataTypes) => {
    const Transaction = sequelize.define('transactions', {
        dokanId: {
            type: DataTypes.INTEGER
        },
        customerId: {
            type: DataTypes.INTEGER
        },
        dokanAdminId: {
            type: DataTypes.INTEGER
        },
        dokanStaffId: {
            type: DataTypes.INTEGER
        },
        transactionAmount: {
            type: DataTypes.DOUBLE,
        },

    }, {
        timestamps: true
    })
    return Transaction
}