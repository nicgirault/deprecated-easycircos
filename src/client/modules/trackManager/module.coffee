module.exports = do(angular) ->
  angular.module 'trackManager', ['html5FileReader', 'ui.app', 'help', 'rules', 'ui-notification']

  require './controllers/track.js'
  require './controllers/edit-data.js'
  require './services/dataParser.js'
  require './directives/backgroundsForm.js'
  require './directives/track-subforms.js'
