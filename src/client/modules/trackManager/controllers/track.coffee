do (angular) ->
  angular.module('trackManager').controller 'trackCtrl', ($scope, circosJS, tracks, helpStore, $modal, trackStore, defaults, dataParser) ->
    $scope.currentForm = 'layout'

    setTrack = () ->
      tracks.getCurrentTrack (currentTrack) ->
        $scope.currentForm = currentTrack.type
        $scope.currentTrack = currentTrack
        # dealing with track library
        $scope.tracks = []
        trackStore.getStore currentTrack.type, tracks.layout.code, (tracks) ->
          $scope.tracks = tracks
          $scope.selected =
            track: null
        $scope.currentTrack.conf.backgrounds = [] unless $scope.currentTrack.conf.backgrounds?
        $scope.currentTrack.conf.rules = [] unless $scope.currentTrack.conf.rules?
        $scope.currentTrack.conf.rawRules = [] unless $scope.currentTrack.conf.rawRules?

    setTrack()
    $scope.$on 'current-track-update', ->
      # clear input type "file" to force triggering data parsing if file is identical
      document.getElementsByClassName('import-file').value = null
      setTrack()

    $scope.updateTrackName = () ->
      tracks.updateName($scope.currentTrack.id, $scope.currentTrack.name)

    $scope.data = dataParser
    $scope.parseData = (dataString) ->
      if dataString
        dataParser.parse dataString, (parsedData) ->
          $scope.currentTrack.data = parsedData
          $scope.render()
      else
        $scope.currentTrack.data = []
        $scope.render()

    $scope.render = ->
      conf = angular.copy($scope.currentTrack.conf)
      if $scope.currentTrack.type == 'heatmap'
        circosJS.easyCircos.heatmap(
          $scope.currentTrack.id,
          conf,
          $scope.currentTrack.data
        )
      else if $scope.currentTrack.type == 'chords'
        circosJS.easyCircos.chord(
          $scope.currentTrack.id,
          conf,
          $scope.currentTrack.data
        )
      else if $scope.currentTrack.type == 'histogram'
        circosJS.easyCircos.histogram(
          $scope.currentTrack.id,
          conf,
          $scope.currentTrack.data,
          [],
          $scope.currentTrack.conf.backgrounds
        )
      else if $scope.currentTrack.type == 'scatter'
        circosJS.easyCircos.scatter(
          $scope.currentTrack.id,
          conf,
          $scope.currentTrack.data,
          $scope.currentTrack.conf.rules,
          $scope.currentTrack.conf.backgrounds
        )
      else if $scope.currentTrack.type == 'line'
        circosJS.easyCircos.line(
          $scope.currentTrack.id,
          conf,
          $scope.currentTrack.data,
          [],
          $scope.currentTrack.conf.backgrounds
        )
      circosJS.easyCircos.render([$scope.currentTrack.id])

    $scope.updatePalette = (palette, isReversed) ->
      $scope.currentTrack.conf.colorPalette = palette.name
      $scope.currentTrack.conf.colorPaletteSize = palette.colors.length
      $scope.currentTrack.conf.colorPaletteReverse = isReversed
      $scope.render()

    $scope.glyph_shapes = d3.svg.symbolTypes
    $scope.interpolationTypes = ['linear', 'monotone', 'cardinal', 'basis']

    $scope.openRulesModal = (configurationParameter, parameterType) ->
      modalInstance = $modal.open
        templateUrl: 'modules/rules/views/rules.html'
        controller: 'modalRuleController'
        resolve:
          configurationParameter: ->
            configurationParameter
          parameterType: ->
            parameterType
          rawRules: ->
            $scope.currentTrack.conf.rawRules.filter((element) ->
              element.parameter == configurationParameter
            )
        backdrop: true
      modalInstance.close = (rules, rawRules) ->
        $scope.currentTrack.conf.rules = rules
        $scope.currentTrack.conf.rawRules = rawRules
        $scope.render()
        modalInstance.dismiss()

    $scope.help = helpStore

    $scope.selectTrack = ->
      trackStore.getTrack $scope.selected.track._id, (track) ->
        $scope.currentTrack.conf = defaults(track.conf, $scope.currentTrack.conf)
        $scope.currentTrack.data = track.data
        $scope.currentTrack.code = track.code
        $scope.render()

    $scope.share = ->
      modalInstance = $modal.open
        templateUrl: 'modules/share/views/share.html'
        controller: 'shareCtrl'
        resolve:
          data: -> $scope.currentTrack.data
          conf: -> $scope.currentTrack.conf
          type: ->$scope.currentForm
        backdrop: true

    $scope.editData = ->
      modalInstance = $modal.open
        templateUrl: 'modules/trackManager/views/edit-data.html'
        controller: 'editTrackDataCtrl'
        resolve:
          data: -> $scope.currentTrack.data
          conf: -> $scope.currentTrack.conf
          type: ->$scope.currentForm
        backdrop: true
      modalInstance.close = (dataString) ->
        $scope.parseData dataString
        modalInstance.dismiss()

    $scope.delete = ->
      tracks.delete($scope.currentTrack.id)
      $scope.toggleLayout()

    return
