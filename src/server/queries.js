const Pool = require('pg').Pool
const pool = new Pool({
    user: 'myapp',
    host: 'localhost',
    database: 'myapp',
    password: process.env.DBPASS,
    port: 5432,
})

const getItems = (request, response) => {
    pool.query('SELECT * FROM list ORDER BY id', (error, results) => {
        if (error) {
            throw error
        }
        response.status(200).json(results.rows)
    })
}

module.exports = {
    getItems
}