do(angular) ->
  angular.module('ui.app').factory 'tracks', ($rootScope) ->
    tracks: {}
    counter: 0
    circosSize: Math.min(window.innerHeight, window.innerWidth) - 60

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
        borders:
          inner: @getSmartInnerBorder()
          outer: @getSmartOuterBorder()

      $rootScope.$broadcast 'tracks-update'
      return @tracks[ trackId ]

    updateName: (trackId, newName) ->
      @tracks[ trackId ].name = newName
      $rootScope.$broadcast 'tracks-update'


    deleteTrack: (trackId) ->
      delete @tracks[ trackId ]
      $rootScope.$broadcast 'tracks-update'

    getTrack: (trackId) ->
      return @tracks[ trackId ]

    getSmartInnerBorder: ->
      100
    getSmartOuterBorder: ->
      110