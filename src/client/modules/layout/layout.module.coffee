module.exports = do(angular) ->
  angular.module 'layout', ['html5FileReader', 'ui.app']

  require './layoutStore.service.js'
  require './layoutForm.controller.js'

  angular.module 'layoutInit', ['track', 'layout']
  require './layoutInit.js'
