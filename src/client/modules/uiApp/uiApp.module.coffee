do (angular) ->
  angular.module 'ui.app', ['ui.bootstrap', 'utils']
  require './uiApp.controller.js'
  require './sidebar.service.js'
  require './sidebar.controller.js'
  require './tracks.service.js'
  require './feedback.controller.js'