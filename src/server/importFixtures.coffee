mongoose = require 'mongoose'

mongoose.connect 'mongodb://easyCircos:easyCircos@localhost/easyCircosDB'
db = mongoose.connection
db.on 'error', console.error.bind(console, 'connection error:')
db.once 'open', -> 
  model = require('./database/model.js').model(mongoose)
  
  # import fixtures
  require('./database/fixtures/import.js').import model
