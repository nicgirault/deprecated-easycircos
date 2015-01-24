module.exports = do(angular, circosJS) ->
  angular.module 'circosJS', []
  
  angular.module('circosJS').factory 'circosJS', ->
    size = Math.min window.innerHeight, window.innerWidth
    size = size - 60
    circosJS.easyCircos = new circosJS
      width: size
      height: size
      container: '#chart'
    circosJS
