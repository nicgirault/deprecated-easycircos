do (angular) ->
  angular.module('share').controller 'shareCtrl', ($scope, $modalInstance, $resource, helpStore, data, conf, type) ->
    Proposition = $resource 'proposition'
    $scope.help = helpStore
    $scope.share = ->
      $scope.$broadcast 'show-errors-check-validity'
      if $scope.form.$valid
        proposition = new Proposition {
          details: $scope.details
          userMeta:
            email: $scope.email
          name: $scope.name
          data: data
          conf: conf
          type: type
        }
        proposition.$save()
        $modalInstance.dismiss()
    $scope.cancel = ->
      $modalInstance.dismiss 'cancel'
