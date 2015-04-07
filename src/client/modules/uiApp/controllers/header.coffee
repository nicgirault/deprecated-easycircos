angular.module('ui.app').controller 'mainCtrl', ($scope, tracks, $modal, browser, helpStore) ->
  $scope.help = helpStore

  $scope.atLeastOne =
    heatmap: false
    chords: false
    histogram: false
    scatter: false
    line: false

  $scope.sidebar = null

  $scope.toggleLayout = ->
    if $scope.sidebar == 'layout'
      $scope.sidebar = null
    else
      $scope.sidebar = 'layout'
      tracks.setCurrentTrack 'layout'

  $scope.$on 'track-name-update', ->
    $scope.tracks = ({id: key, type: track.type, name: track.name} for key,track of tracks.tracks)

  $scope.editTrack = (trackId) ->
    tracks.setCurrentTrack trackId
    $scope.sidebar = tracks.getTrack(trackId).type

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
      type: 'tiles'
      enabled: true
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

  $scope.openExport = ->
    modalInstance = $modal.open
      templateUrl: 'modules/export/views/export.html'
      controller: 'exportCtrl'

  $scope.openNews = ->
    modalInstance = $modal.open
      templateUrl: 'modules/news/views/news.html'
      controller: 'newsCtrl'

  $scope.$on 'new-notification', ->
    $scope.hightlightNotifications = true
  $scope.openNotifications = ->
    $scope.hightlightNotifications = false
    modalInstance = $modal.open
      templateUrl: 'modules/circosNotifications/views/notificationHistory.html'
      controller: 'notificationHistoryCtrl'

  $scope.openNewTrack = ->
    modalInstance = $modal.open
      templateUrl: 'modules/uiApp/views/track-types.html'
      controller: 'newTrackCtrl'
      resolve:
        trackTypes: -> $scope.trackTypes
    modalInstance.close = (trackType) ->
      tracks.addTrack(null, trackType, (trackId) ->
        # the new track becomes the currentTrack
        tracks.setCurrentTrack trackId

        # update list of tracks in edit button
        $scope.tracks = ({id: key, type: track.type, name: track.name} for key,track of tracks.tracks)

        $scope.atLeastOne[trackType] = true
      )
      $scope.sidebar = trackType
      modalInstance.dismiss()
