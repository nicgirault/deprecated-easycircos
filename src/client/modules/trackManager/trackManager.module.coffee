module.exports = do(angular) ->
  angular.module 'trackManager', ['html5FileReader', 'ui.app', 'help']

  require './controllers/track.js'
  require './services/dataParser.js'
