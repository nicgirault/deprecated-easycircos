module.exports = do(angular) ->
  angular.module('inputdata').controller 'DataModalCtrl', ($scope, $modalInstance, data) ->

    $scope.cancel = ->
      $modalInstance.dismiss 'cancel'

    $modalInstance.opened
      .then ->
        $scope.data = data
        $scope.tableWidth = 500;
        console.log $modalInstance