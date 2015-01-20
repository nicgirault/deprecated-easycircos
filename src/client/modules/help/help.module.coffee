module.exports = do(angular) ->
  angular.module 'help', []
  require './helpStore.service.js'

  angular.module('help').controller 'ModalCancelCtrl', ($scope, $modalInstance) ->
    $scope.cancel = ->
      $modalInstance.dismiss 'cancel'