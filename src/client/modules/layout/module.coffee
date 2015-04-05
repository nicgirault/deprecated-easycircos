module.exports = do(angular) ->
  angular.module 'layout', ['html5FileReader', 'ui.app']

  require './services/layoutStore.js'
  require './controllers/form.js'
  require './controllers/edit.js'

  angular.module 'layoutInit', ['track', 'layout']
  require './layoutInit.js'
