const { Sequelize, DataTypes } = require('sequelize')
const dotenv = require('dotenv')
dotenv.config()
const DB_NAME = process.env.DATABASE_NAME
const DB_USERNAME = process.env.DATABASE_USERNAME
const DB_PASSWORD = process.env.DATABASE_PASSWORD



const sequelize = new Sequelize("amar_dokan", "root", "", {
    host: 'localhost',
    dialect: 'mysql',
    pool: { max: 5, min: 0, idle: 1000 }
})

//
// const sequelize = new Sequelize("myallpr1_amar_dokan", "myallpr1_amar_dokan", "E-qETuillYNX", {
//         host: 'localhost',
//         dialect: 'mysql',
//         pool: { max: 5, min: 0, idle: 10000 }
//     })
//

sequelize.authenticate()
    .then(() => {
        console.log('Database connect success')
    })
    .catch(error => {
        console.log('error' + error)
    })

const db = {}
db.Sequelize = Sequelize
db.sequelize = sequelize

db.sequelize.sync({ force: false })
    .then(() => {
        console.log('sync databse')
    })
    .catch(e => {
        console.log(e)
    })


db.dokanAdmin = require('./dokanAdmin')(sequelize, DataTypes)
db.dokanStaff = require('./dokanStaff')(sequelize, DataTypes)
db.customer = require('./customer')(sequelize, DataTypes)
db.transaction = require('./transaction')(sequelize, DataTypes)

// one to many relation between customer table and transaction table
db.customer.hasMany(db.transaction, { foreignKey: 'customerId' });
db.transaction.belongsTo(db.customer, { foreignKey: 'customerId' })

// one to one relation between satff and transaction table 
db.dokanStaff.hasOne(db.transaction)
db.transaction.belongsTo(db.dokanStaff)



module.exports = db