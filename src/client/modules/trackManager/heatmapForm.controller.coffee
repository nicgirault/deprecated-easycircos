# A heatmap configuration
# innerRadius: 200
# outerRadius: 250
# min: 'smart'
# max: 'smart'
# colorPalette: 'YlGnBu'
# colorPaletteSize: 9
do (angular) ->
  angular.module('trackManager').controller 'heatmapFormCtrl', ($scope, circosJS, yaml, tracks, sidebar, helpStore, $modal) ->
    $scope.currentTrack =
      id: undefined
      name: undefined
      conf: angular.copy circosJS.Heatmap.prototype._defaultConf
      data: []

    $scope.$on 'sidebar-update', (event, message) ->
      unless message.trackType == 'heatmap'
        return
      # clear input type "file" to force triggering data parsing if file is identical
      document.getElementById('import-heatmap-file').value = null
      $scope.currentTrack.id = sidebar.currentTrack.id
      $scope.currentTrack.name = sidebar.currentTrack.name
      if message.isNew
        $scope.currentTrack.conf = angular.copy circosJS.Heatmap.prototype._defaultConf
        $scope.currentTrack.conf.innerRadius = sidebar.currentTrack.borders.inner
        $scope.currentTrack.conf.outerRadius = sidebar.currentTrack.borders.outer
        $scope.currentTrack.data = []
      else
        $scope.currentTrack.conf = angular.copy circosJS.easyCircos._heatmaps[sidebar.currentTrack.id]._conf
        $scope.currentTrack.data = angular.copy circosJS.easyCircos._heatmaps[sidebar.currentTrack.id]._data

    dataFormats = ['.yml', '.csv', '.tsv', '.dsv ";"', '.dsv " "'] 
    $scope.dataFormat = dataFormats[0]
    $scope.toggleDataFormat = ->
      key = dataFormats.indexOf $scope.dataFormat
      if key == dataFormats.length - 1
        $scope.dataFormat = dataFormats[0]
      else
        $scope.dataFormat = dataFormats[key+1]
    $scope.updateTrackName = () ->
      tracks.updateName($scope.currentTrack.id, $scope.currentTrack.name)

    $scope.parseData = ($fileContent) ->
      # todo: validate data
      if $scope.dataFormat == '.yml'
        $scope.currentTrack.data = yaml.load $fileContent
      else
        if $scope.dataFormat == '.csv ","'
          delimiter = ','
        else if $scope.dataFormat == '.dsv ";"'
          delimiter = ';'
        else if $scope.dataFormat == '.dsv " "'
          delimiter = ' '
        else if $scope.dataFormat == '.tsv'
          delimiter = '\t'
        Papa.parse($fileContent, {
          complete: (results) ->
            $scope.currentTrack.data = results.data
          delimiter: delimiter
        })
      $scope.render()

    $scope.render = ->
      conf = angular.copy($scope.currentTrack.conf)
      circosJS.easyCircos.heatmap(
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
