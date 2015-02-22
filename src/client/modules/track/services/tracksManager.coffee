do (angular) ->
  angular.module('track').factory 'tracks', ($rootScope, confManager, circosJS) ->
    tracks: {}
    layout:
      id: 'layout'
      type: 'layout'
      library_id: undefined
    counter: 0
    circosSize: Math.min(window.innerHeight, window.innerWidth) - 60
    currentTrackId: 'layout'

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
      $rootScope.$broadcast 'track-name-update'


    delete: (trackId) ->
      circosJS.easyCircos.removeTracks(trackId)
      delete @tracks[ trackId ]
      $rootScope.$broadcast 'track-name-update'

    deleteAll: ->
      circosJS.easyCircos.removeTracks()
      @tracks = []
      $rootScope.$broadcast 'track-name-update'

    getTrack: (trackId) ->
      return @tracks[ trackId ]

    setCurrentTrack: (trackId) ->
      @currentTrackId = trackId
      $rootScope.$broadcast 'current-track-update'

    getCurrentTrack: (callback) ->
      if @currentTrackId == 'layout'
        layout = @layout
        layout.conf = confManager.getConf 'layout'
        layout.data = confManager.getData 'layout'
        callback(layout)
      else
        currentTrack = @tracks[ @currentTrackId ]
        currentTrack.conf = confManager.getConf @currentTrackId, currentTrack.type
        callback(currentTrack)


