var express = require('express')
var app = express()

app.get('/', function(req, res) {
    res.send('Hello world')
    console.log('get request')
    console.log(req)
})

app.listen(3000)
