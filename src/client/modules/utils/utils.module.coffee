module.exports = do(angular) ->
  angular.module 'utils', []

  angular.module('utils').factory 'browser', ($window) ->
      return ->
        userAgent = $window.navigator.userAgent
        browsers =
          chrome: /chrome/i
          safari: /safari/i
          firefox: /firefox/i
          ie: /internet explorer/i

        for key of browsers
          return key  if browsers[key].test(userAgent)
        'unknown'

  angular.module('utils').controller 'alertCtrl', ($scope, browser) ->
    $scope.alerts = []
    unless browser() == 'chrome'
      $scope.alerts.push {
        type: 'danger'
        message: 'Easy Circos uses fonctionalities from last generation browsers. Please, consider using Chrome.'
      }
    $scope.closeAlert = (index) ->
      $scope.alerts.splice index, 1
