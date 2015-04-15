do (angular) ->
  angular.module('layout').controller 'layoutCtrl', ($scope, layoutStore, tracks, defaults, helpStore, dataParser, $modal) ->
    $scope.help = helpStore
    tracks.getCurrentTrack (layout) ->
      $scope.layout = layout

      $scope.layouts = []
      layoutStore.getStore (layouts) ->
        $scope.layouts = layouts
        if tracks.layout.code?
          for layout in layouts
            if layout.code == tracks.layout.code
              $scope.selected =
                layout: layout
              break

    $scope.data = dataParser
    $scope.parseData = ($fileContent) ->
      dataParser.parse($fileContent, (parsedData) ->
        $scope.layout.code = null
        $scope.layout.data = parsedData
        $scope.render(true)
      )

    $scope.selectLayout = ->
      layoutStore.getLayout $scope.selected.layout._id, (layout) ->
        buffer = $scope.layout.conf
        $scope.layout = layout
        $scope.layout.conf = defaults(layout.conf, buffer)
        tracks.layout.code = layout.code
        $scope.render(true)

    $scope.render = (removeTracks) ->
      conf = angular.copy($scope.layout.conf)
      circosJS.easyCircos.layout(conf, $scope.layout.data).render(['layout'], removeTracks)

      if removeTracks
        tracks.deleteAll()

    $scope.showLayoutDataFormModal = () ->
      modalInstance = $modal.open
        templateUrl: 'modules/layout/views/edit.html'
        controller: 'layoutDataCtrl'
        resolve:
          data: -> $scope.layout.data
        backdrop: true
      modalInstance.close = (data) ->
        $scope.layout.data = data
        $scope.render()
        modalInstance.dismiss()

    $scope.share = ->
      modalInstance = $modal.open
        templateUrl: 'modules/share/views/share.html'
        controller: 'shareCtrl'
        resolve:
          data: -> $scope.layout.data
          conf: -> $scope.layout.conf
          type: -> 'layout'
        backdrop: true

    $scope.labelAlignement = null
    $scope.help = helpStore
