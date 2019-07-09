const express = require('express')
const bodyParser = require('body-parser')
const db = require('./queries')
const app = express()
const port = process.env.PORT || 3000

app.use(bodyParser.json())
app.use(
    bodyParser.urlencoded({
        extended: true,
    })
)

app.use(express.static('public'))

app.get('/items', db.getItems)

app.listen(port, () => {
    console.log(`App running on port ${port}.`)
})