do (angular) ->
  angular.module('track').factory 'tracks', ($rootScope, confManager) ->
    tracks: {}
    counter: 0
    circosSize: Math.min(window.innerHeight, window.innerWidth) - 60
    currentTrackId: undefined

    addTrack: (trackName, trackType, callback) ->
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
        conf: null

      # $rootScope.$broadcast 'tracks-update'
      callback trackId

    updateName: (trackId, newName) ->
      @tracks[ trackId ].name = newName
      $rootScope.$broadcast 'tracks-update'


    deleteTrack: (trackId) ->
      delete @tracks[ trackId ]
      $rootScope.$broadcast 'tracks-update'

    getTrack: (trackId) ->
      return @tracks[ trackId ]

    setCurrentTrack: (trackId) ->
      @currentTrackId = trackId
      $rootScope.$broadcast 'current-track-update'

    getCurrentTrack: (callback) ->
      currentTrack = @tracks[ @currentTrackId ]
      currentTrack.conf = confManager.getConf @currentTrackId, currentTrack.type
      callback(currentTrack)

    