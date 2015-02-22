do (angular) ->
  angular.module 'ui.app', ['ui.bootstrap', 'utils']
  require './controllers/header.js'
  require './controllers/feedback.js'

  angular.module('ui.app').directive('confirmDelete', ->
    return {
      replace: true,
      templateUrl: 'modules/uiApp/views/deleteConfirmation.html',
      scope: {
        onConfirm: '&'
        popup: '@'
      }
      controller: ($scope) ->
        $scope.isDeleting = false
        $scope.startDelete = ->
          $scope.isDeleting = true
        $scope.cancel = ->
          $scope.isDeleting = false
        $scope.confirm = ->
          $scope.isDeleting = false
          $scope.onConfirm()
    }
  )
