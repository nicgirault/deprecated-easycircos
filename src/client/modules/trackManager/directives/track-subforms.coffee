do (angular) ->
  angular.module('trackManager').directive 'trackData', ->
    restrict: 'E'
    templateUrl: 'modules/trackManager/views/track-data.html'
    scope: true

  angular.module('trackManager').directive 'trackSettings', ->
    restrict: 'E'
    templateUrl: 'modules/trackManager/views/track-settings.html'
    scope: true

  angular.module('trackManager').directive 'trackPosition', ->
    restrict: 'E'
    templateUrl: 'modules/trackManager/views/track-position.html'
    scope: true

  angular.module('trackManager').directive 'trackAxes', ->
    restrict: 'E'
    templateUrl: 'modules/trackManager/views/track-axes.html'
    scope: true

  angular.module('trackManager').directive 'trackColorScale', ->
    restrict: 'E'
    templateUrl: 'modules/trackManager/views/track-color-scale.html'
    scope: true
