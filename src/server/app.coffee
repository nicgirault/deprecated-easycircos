express = require 'express'
fs = require 'fs'
yaml = require 'js-yaml'
mongoose = require 'mongoose'

app = express()

mongoose.connect 'mongodb://localhost/easyCircos2'
db = mongoose.connection
db.on 'error', console.error.bind(console, 'connection error:')
app.use '/bower_components', express.static 'bower_components'
app.use '/', express.static 'www/client'

db.once 'open', -> 
  require('./layoutManager.js').init(app, mongoose)

app.listen 3000
