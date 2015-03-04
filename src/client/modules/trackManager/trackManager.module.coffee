module.exports = do(angular) ->
  angular.module 'trackManager', ['html5FileReader', 'ui.app', 'help', 'rules']

  require './controllers/track.js'
  require './services/dataParser.js'
  require './directives/backgroundsForm.js'
