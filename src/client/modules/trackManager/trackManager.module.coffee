module.exports = do(angular) ->
  angular.module 'trackManager', ['html5FileReader', 'ui.app', 'help', 'inputdata']

  require './controllers/track.js'
