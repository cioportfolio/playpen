const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const db = require('./queries.js')
const app = express()
const port = process.env.PORT || 3000

app.use(cors())
app.use(bodyParser.json())
app.use(
    bodyParser.urlencoded({
        extended: true,
    })
)

/* app.use(express.static('public')) */

function getItems (request, response) {
    db.getItems(rows => {
        return response.status(200).json(rows)
    })
}

app.get('/items', getItems)

app.listen(port, () => {
    console.log(`App running on port ${port}.`)
})
