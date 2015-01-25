do (angular) ->
  angular.module('track').factory 'trackStore', ($http) ->
    getStore: (trackType, callback) ->
      $http.get('/tracks/' + trackType).
        success (tracks) ->
          callback tracks
        
    getTrack: (id, callback) ->
      $http.get('/track/' + id).
        success (track) ->
          callback track
