const express = require('express')
const bodyParser = require('body-parser')
const db = require('./queries.js')
const app = express()
const port = process.env.PORT || 3000

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

app.get('/api/items', getItems)

app.listen(port, () => {
    console.log(`App running on port ${port}.`)
})
