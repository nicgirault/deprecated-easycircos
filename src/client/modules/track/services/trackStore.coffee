do (angular) ->
  angular.module('track').factory 'trackStore', ($http) ->
    getStore: (trackType, layoutCode, callback) ->
      $http.get('/layout/' + layoutCode + '/tracks/' + trackType).
        success (tracks) ->
          callback tracks

    getTrack: (id, callback) ->
      $http.get('/track/' + id).
        success (track) ->
          callback track
