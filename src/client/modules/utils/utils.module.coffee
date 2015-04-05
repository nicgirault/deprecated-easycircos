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

  angular.module('utils').directive 'showErrors', ->
    restrict: 'A',
    require:  '^form',
    link: (scope, el, attrs, formCtrl) ->
      # find the text box element, which has the 'name' attribute
      inputEl   = el[0].querySelector '[name]'
      # convert the native text box element to an angular element
      inputNgEl = angular.element inputEl
      # get the name on the text box so we know the property to check
      # on the form controller
      inputName = inputNgEl.attr 'name'

      # only apply the has-error class after the user leaves the text box
      inputNgEl.bind 'blur', ->
        el.toggleClass 'has-error', formCtrl[inputName].$invalid

      scope.$on 'show-errors-check-validity', ->
        el.toggleClass 'has-error', formCtrl[inputName].$invalid
