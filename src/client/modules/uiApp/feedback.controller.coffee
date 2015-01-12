angular.module('ui.app').controller 'feedbackCtrl', ($scope, $modalInstance) ->
  $scope.send = ->
    $modalInstance.close()

  $scope.cancel = ->
    $modalInstance.dismiss 'cancel'
