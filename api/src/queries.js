const Pool = require('pg').Pool
const pool = new Pool({
    user: 'myapp',
    host: 'localhost',
    database: 'myapp',
    password: process.env.DBPASS,
    port: 5432,
})

function getItems(processItems) {
    pool.query('SELECT * FROM list ORDER BY id', (error, results) => {
        if (error) {
            throw error
        }
        processItems(results.rows)
    })
}

module.exports = {
    getItems
}