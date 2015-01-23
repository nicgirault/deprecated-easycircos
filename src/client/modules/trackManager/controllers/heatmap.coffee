# A heatmap configuration
# innerRadius: 200
# outerRadius: 250
# min: 'smart'
# max: 'smart'
# colorPalette: 'YlGnBu'
# colorPaletteSize: 9
do (angular) ->
  angular.module('trackManager').controller 'heatmapFormCtrl', ($scope, circosJS, tracks, sidebar, helpStore, $modal, trackStore, defaults, dataParser) ->
    $scope.currentTrack =
      id: undefined
      name: undefined
      conf: angular.copy circosJS.Heatmap.prototype._defaultConf #*****************
      data: []

    $scope.$on 'sidebar-update', (event, message) ->
      unless message.trackType == 'heatmap'
        return
      # clear input type "file" to force triggering data parsing if file is identical
      document.getElementById('import-heatmap-file').value = null
      $scope.currentTrack.id = sidebar.currentTrack.id
      $scope.currentTrack.name = sidebar.currentTrack.name
      if message.isNew
        $scope.currentTrack.conf = angular.copy circosJS.Heatmap.prototype._defaultConf #**********************
        $scope.currentTrack.conf.innerRadius = sidebar.currentTrack.borders.inner
        $scope.currentTrack.conf.outerRadius = sidebar.currentTrack.borders.outer
        $scope.currentTrack.data = []
      else
        $scope.currentTrack.conf = angular.copy circosJS.easyCircos._heatmaps[sidebar.currentTrack.id]._conf
        $scope.currentTrack.data = angular.copy circosJS.easyCircos._heatmaps[sidebar.currentTrack.id]._data

    $scope.updateTrackName = () ->
      tracks.updateName($scope.currentTrack.id, $scope.currentTrack.name)

    $scope.data = dataParser
    $scope.parseData = ($fileContent) ->
      dataParser.parse($fileContent, (parsedData) ->
        $scope.currentTrack.data = parsedData
        $scope.render()
      )

    $scope.render = ->
      conf = angular.copy($scope.currentTrack.conf)
      circosJS.easyCircos.heatmap( #**************************
        $scope.currentTrack.id,
        $scope.currentTrack.conf,
        $scope.currentTrack.data
      ).render()

    $scope.updatePalette = (paletteName, range, palette) ->
      $scope.currentTrack.conf.colorPalette = paletteName
      $scope.currentTrack.conf.colorPaletteSize = range
      $scope.render()

    $scope.showHeatmapDataModal = ->
      modalInstance = $modal.open
        templateUrl: 'modules/help/heatmapData.modal.html'
        controller: 'ModalCancelCtrl'
        backdrop: true

    $scope.help = helpStore

    $scope.tracks = []
    trackStore.getStore (tracks) ->
      $scope.tracks = tracks
      $scope.dd =
        selectedTrack: null

    $scope.selectTrack = ->
      trackStore.getTrack $scope.dd.selectedTrack._id, (track) ->
        $scope.currentTrack.conf = defaults(track.conf, $scope.currentTrack.conf)
        $scope.currentTrack.data = track.data
        $scope.render()
