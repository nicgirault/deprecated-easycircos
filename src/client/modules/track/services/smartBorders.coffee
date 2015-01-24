do (angular) ->
  angular.module('track').factory 'smartBorders', ->
    borders = []
    return {
      getSmartInnerBorder: ->
        180
      getSmartOuterBorder: ->
        200
    }