express = require 'express'
fs = require 'fs'
yaml = require 'js-yaml'
mongoose = require 'mongoose'

app = express()

mongoose.connect 'mongodb://localhost/easyCircosDB'
db = mongoose.connection
db.on 'error', console.error.bind(console, 'connection error:')
app.use '/bower_components', express.static 'bower_components'
app.use '/', express.static 'www/client'

db.once 'open', -> 
  model = require('./database/model.js').model mongoose

  # if layout collection is empty, import fixtures
  # model.Layout.count (error, count) ->
    # if count == 0
  model.Layout.remove {}, ->
    model.Layout.create require('./database/fixtures/layouts/catalog.js').data

  # define Layout routes
  require('./database/layoutManager.js').init app, model.Layout

app.listen 3000
