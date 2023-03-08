const dokanAdminAuthRoute = require('./dokanAdminAuthRoute')
const dokanStaffAuthRoute = require('./dokanStaffAuthRoute')
const dokanStaffManageRoute = require('./dokanStaffManageRoute')
const customerRoute = require('./customerRoute')


const routes = [{
        path: '/api/customer',
        handler: customerRoute
    },
    {
        path: '/api/manage/dokan-staff',
        handler: dokanStaffManageRoute
    },
    {
        path: '/api/auth/dokanAdmin',
        handler: dokanAdminAuthRoute
    },
    {
        path: '/api/auth/dokanStaff',
        handler: dokanStaffAuthRoute
    },
    {
        path: '/',
        handler: (req, res) => {
            return res.json({ msg: 'welcome to my application' })
        }
    }
]

module.exports = (app) => {
    routes.forEach(r => {
        if (r.path == '/') {
            app.get(r.path, r.handler)
        } else {
            app.use(r.path, r.handler)
        }
    })
}