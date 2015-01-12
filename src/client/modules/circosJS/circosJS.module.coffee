module.exports = do(angular, circosJS) ->
  angular.module 'circosJS', []
  # require './color.controllers.js'
  # require './color.directives.js'
  
  angular.module('circosJS').factory 'circosJS', ->
    circosJS.easyCircos = new circosJS
        width: 600
        height: 600
        container: '#chart'
    circosJS
