do (angular) ->
  angular.module 'ui.app', ['ui.bootstrap', 'utils']
  require './controllers/header.js'
  require './controllers/feedback.js'
  require './sidebar.service.js'
  require './sidebar.controller.js'
