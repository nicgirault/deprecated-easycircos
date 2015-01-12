do(angular) ->
  angular.module('ui.app').factory 'sidebar', ($rootScope) ->
    show: 'layout'
    currentTrack: undefined
    load: (track, isNew) ->
      if track == 'layout'
        @show = 'layout'
        @currentTrack = null

      # else it's a track
      else
        @currentTrack = track
        @show = track.type

      $rootScope.$broadcast 'sidebar-update', {isNew: isNew, trackType: track.type}
