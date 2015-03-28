do (angular) ->
  angular.module('layout').controller 'layoutDataCtrl', ($scope, $modalInstance, data) ->

    $scope.data = data
    $scope.newDatum = ->
      color = if $scope.colorPalette? then $scope.palette[$scope.data.length%$scope.colorPaletteSize] else null
      $scope.data.push {
        id: null
        len: null
        color: color
        label: null
      }

    $scope.newDatum() unless $scope.data.length

    $scope.colorPalette = 'Blues'
    $scope.colorPaletteSize = 9
    $scope.updatePalette = (paletteName, range, palette) ->
      $scope.palette = palette
      $scope.colorPalette = paletteName
      $scope.colorPaletteSize = range
      $scope.data.map (datum, i) ->
        datum.color = palette[i%range]

    $scope.deleteDatum = (index) ->
      $scope.data.splice index, 1

    $scope.deleteData = ->
      $scope.data = []

    $scope.save = () ->
      $scope.data.filter (datum) ->
        datum.id? and datum.id.length > 0 and datum.len > 0
      $modalInstance.close($scope.data)

    $scope.cancel = ->
      $modalInstance.dismiss 'cancel'
