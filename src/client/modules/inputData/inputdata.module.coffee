module.exports = do (angular) ->
  angular.module 'inputdata', []
  require './controllers/modalCtrl.js'
  require './services/dataParser.js'
