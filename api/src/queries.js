const Pool = require('pg').Pool
const pool = new Pool({
    user: 'postgres',
    host: process.env.DB_IP,
    database: 'postgres',
    password: process.env.DB_PASS,
    port: 5432
})

pool.on('error', (err, client) => {
    console.error('Unexpected error on idle client', err)
    process.exit(-1)
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