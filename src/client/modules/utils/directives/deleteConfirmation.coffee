do(angular) ->
  angular.module('utils').directive 'confirmDelete', ->
    replace: true
    templateUrl: 'modules/utils/views/deleteConfirmation.html'
    scope:
      onConfirm: '&'
      popup: '@'
      buttonClass: '@'
    controller: ($scope) ->
      $scope.isDeleting = false
      $scope.startDelete = ->
        $scope.isDeleting = true
      $scope.cancel = ->
        $scope.isDeleting = false
      $scope.confirm = ->
        $scope.isDeleting = false
        $scope.onConfirm()
