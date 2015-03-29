angular.module('ui.app').controller 'mainCtrl', ($scope, tracks, $modal, browser) ->
  # buttons state in header
  $scope.status =
    new_track_isopen: false
    track_isopen: false
    active: 'layout'

  $scope.atLeastOne =
    heatmap: false
    chords: false
    histogram: false
    scatter: false
    line: false

  $scope.showLayout = ->
    $scope.status.active = 'layout'
    tracks.setCurrentTrack 'layout'

  $scope.$on 'track-name-update', ->
    $scope.tracks = ({id: key, type: track.type, name: track.name} for key,track of tracks.tracks)

  $scope.newTrack = (trackType) ->
    tracks.addTrack(null, trackType, (trackId) ->
      # the new track becomes the currentTrack
      tracks.setCurrentTrack trackId

      # update list of tracks in edit button
      $scope.tracks = ({id: key, type: track.type, name: track.name} for key,track of tracks.tracks)

      $scope.atLeastOne[trackType] = true
    )
    $scope.status.active = ''

  $scope.editTrack = (trackId) ->
    tracks.setCurrentTrack trackId
    $scope.status.active = ''

  $scope.trackTypes = [
    {
      label: 'Heatmap'
      type: 'heatmap'
      enabled: true
    }
    {
      label: 'Chords'
      type: 'chords'
      enabled: true
    }
    {
      label: 'Histogram'
      type: 'histogram'
      enabled: true
    }
    {
      label: 'Scatter'
      type: 'scatter'
      enabled: true
    }
    {
      label: 'Line'
      type: 'line'
      enabled: true
    }
    {
      label: 'Connectors'
      type: 'Connectors'
      enabled: false
    }
    {
      label: 'Tiles'
      type: 'Tiles'
      enabled: false
    }
    {
      label: 'Highlight'
      type: 'Highlight'
      enabled: false
    }
    {
      label: 'Text'
      type: 'Text'
      enabled: false
    }
  ]
  $scope.trackType = null

  $scope.openFeedbackModal = ->
    modalInstance = $modal.open
      templateUrl: 'modules/uiApp/views/feedback.html'
      controller: 'feedbackCtrl'

  $scope.openNews = ->
    modalInstance = $modal.open
      templateUrl: 'modules/news/views/news.html'
      controller: 'newsCtrl'

  $scope.openHelpModal = ->
    modalInstance = $modal.open
      templateUrl: 'modules/uiApp/views/help.html'
      controller: 'feedbackCtrl'
    # modalInstance.result.then ((selectedItem) ->
    #   $scope.selected = selectedItem
    #   return
    # ), ->
    #   $log.info "Modal dismissed at: " + new Date()
    #   return

    # return
