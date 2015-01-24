angular.module('ui.app').controller 'mainCtrl', ($scope, tracks, $modal, browser) ->
  # buttons state in header
  $scope.status =
    new_track_isopen: false
    track_isopen: false
    active: 'layout'

  $scope.showLayout = ->
    $scope.status.active = 'layout'
    sidebar.load('layout')

  $scope.newTrack = (trackType) ->
    tracks.addTrack(null, trackType, (trackId) ->
      # the new track becomes the currentTrack
      tracks.setCurrentTrack trackId

      # update list of tracks in edit button
      $scope.tracks = ({id: key, type: track.type, name: track.name} for key,track of tracks.tracks)
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
      enabled: false
    }
    {
      label: 'Histogram'
      type: 'histogram'
      enabled: false
    }
  ]
  # a.disabled-link(href='#') Connectors
  #     li
  #       a.disabled-link(href='#') Highlight
  #     li
  #       a.disabled-link(href='#') Line
  #     li
  #       a.disabled-link(href='#') Scatter
  #     li
  #       a.disabled-link(href='#') Text
  #     li
  #       a.disabled-link(href='#') Tiles
  $scope.trackType = null

  $scope.openFeedbackModal = ->
    modalInstance = $modal.open
      templateUrl: 'modules/uiApp/feedback.modal.html'
      controller: 'feedbackCtrl'
  $scope.openHelpModal = ->
    modalInstance = $modal.open
      templateUrl: 'modules/uiApp/help.modal.html'
      controller: 'feedbackCtrl'
    # modalInstance.result.then ((selectedItem) ->
    #   $scope.selected = selectedItem
    #   return
    # ), ->
    #   $log.info "Modal dismissed at: " + new Date()
    #   return

    # return
  
