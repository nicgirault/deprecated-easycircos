do (angular) ->
  angular.module('ui.app').controller 'sidebarCtrl', ($scope, sidebar) ->
    $scope.sidebar = sidebar
    $scope.$on 'sidebar-update', ->
      $scope.sidebar = sidebar