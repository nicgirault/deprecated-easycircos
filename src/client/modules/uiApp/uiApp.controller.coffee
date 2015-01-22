angular.module('ui.app').controller 'mainCtrl', ($scope, tracks, sidebar, $modal, browser) ->
  # buttons state in header
  $scope.status =
    new_track_isopen: false
    track_isopen: false
    active: 'layout'

  $scope.$on 'tracks-update', ->
    $scope.tracks = ({id: key, type: track.type, name: track.name} for key,track of tracks.tracks)

  $scope.showLayout = ->
    $scope.status.active = 'layout'
    sidebar.load('layout')

  $scope.newTrack = (trackType) ->
    currentTrack = tracks.addTrack(null, trackType)
    sidebar.load(currentTrack, true)
    $scope.status.active = ''

  $scope.editTrack = (trackId) ->
    currentTrack = tracks.getTrack(trackId)
    sidebar.load(currentTrack, false)
    $scope.status.active = ''

  $scope.trackTypes = [
    {
      type: 'Heatmap'
      template: 'modules/trackManager/views/heatmap.form.html'
    }
    {
      type: 'Chords'
      template: 'todo'
    }
    {
      type: 'Histogram'
      template: 'todo'
    }
  ]
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
  
