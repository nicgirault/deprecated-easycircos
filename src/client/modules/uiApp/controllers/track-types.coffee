angular.module('ui.app').controller 'newTrackCtrl', ($scope, $modalInstance, trackTypes, helpStore) ->
  $scope.help = helpStore
  $scope.trackTypes = trackTypes
  $scope.cancel = ->
    $modalInstance.dismiss 'cancel'

  $scope.select = (type) ->
    $modalInstance.close type
