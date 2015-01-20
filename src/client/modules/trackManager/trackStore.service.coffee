do (angular) ->
  angular.module('trackManager').factory 'trackStore', ($http) ->
    getStore: (callback) ->
      $http.get('/tracks').
        success (tracks) ->
          callback tracks
        
    getTrack: (id, callback) ->
      $http.get('/track/' + id).
        success (track) ->
          callback track
