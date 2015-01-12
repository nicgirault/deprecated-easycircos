do (angular) ->
  angular.module('layout').factory 'layoutStore', ($http) ->
    getStore: (callback) ->
      $http.get('/layouts').
        success (layouts) ->
          callback layouts
        
    getLayout: (id, callback) ->
      $http.get('/layout/' + id).
        success (layout) ->
          callback layout