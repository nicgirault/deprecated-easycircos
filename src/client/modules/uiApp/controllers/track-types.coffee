angular.module('ui.app').controller 'newTrackCtrl', ($scope, $modalInstance, trackTypes) ->
  $scope.trackTypes = trackTypes
  $scope.cancel = ->
    $modalInstance.dismiss 'cancel'

  $scope.select = (type) ->
    $modalInstance.close type
