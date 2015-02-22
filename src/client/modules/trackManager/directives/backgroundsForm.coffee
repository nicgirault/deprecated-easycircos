do (angular) ->
  angular.module('trackManager').directive('backgroundsForm', ->
    return {
      restrict: 'E'
      replace: true
      templateUrl: 'modules/trackManager/views/backgroundsForm.html'
      scope: {
        backgrounds: '='
        onChangeCallback: '&'
      }
      controller: ($scope) ->

        $scope.newBackground = ->
          colors = ['#8dd3c7', '#ffffb3', '#bebada', '#fb8072', '#80b1d3', '#fdb462', '#b3de69', '#fccde5', '#d9d9d9', '#bc80bd']
          $scope.backgrounds.push {
            name: 'background'+ ($scope.backgrounds.length+1).toString()
            start: 0.2 * $scope.backgrounds.length
            end: 0.2 * ($scope.backgrounds.length + 1)
            color: colors[$scope.backgrounds.length]
          }
          $scope.currentBackground = $scope.backgrounds[..].pop()
          $scope.onChangeCallback()
        $scope.deleteBackground = ->
          index = $scope.backgrounds.indexOf($scope.currentBackground)
          if index > -1
            $scope.backgrounds.splice index, 1
          $scope.currentBackground = null
          $scope.onChangeCallback()
        $scope.updateModel = ->
          $scope.onChangeCallback()
    }
  )
