module.exports = (sequelize, DataTypes) => {
    const DokanStaff = sequelize.define('dokanstaff', {
        dokanId: {
            type: DataTypes.INTEGER
        },
        staffName: {
            type: DataTypes.STRING
        },
        phone: {
            type: DataTypes.STRING
        },
        password: {
            type: DataTypes.STRING
        },
        status: {
            type: DataTypes.STRING
        }
    }, {
        timestamps: true
    })
    return DokanStaff
}