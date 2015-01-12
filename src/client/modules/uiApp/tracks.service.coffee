do(angular) ->
  angular.module('ui.app').factory 'tracks', ($rootScope) ->
    tracks: {}
    counter: 0

    addTrack: (trackName, trackType) ->
      # check name does not exist
      if trackName in (track.name for key,track of @tracks)
        return null

      # increment counter
      @counter += 1
      trackId = trackType + @counter

      # if name in null, find a name
      unless trackName?
        trackName = trackType + ' ' + @counter

      # add track
      @tracks[ trackId ] =
        id: trackId
        type: trackType
        name: trackName

      $rootScope.$broadcast 'tracks-update'
      return {
        id: trackId
        name: trackName
        type: trackType
      }

    updateName: (trackId, newName) ->
      @tracks[ trackId ].name = newName
      $rootScope.$broadcast 'tracks-update'


    deleteTrack: (trackId) ->
      delete @tracks[ trackId ]
      $rootScope.$broadcast 'tracks-update'

    getTrack: (trackId) ->
      return @tracks[ trackId ]
