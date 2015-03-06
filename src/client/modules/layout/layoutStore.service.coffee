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

    getDefaultLayout: (callback) ->
      $http.get('/layout/default').
        success (layout) ->
          callback layout

    getLayoutByCode: (code, callback) ->
      $http.get('/layout-code/' + code).
        success (layout) ->
          callback layout
