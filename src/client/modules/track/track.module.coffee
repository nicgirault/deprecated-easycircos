module.exports = do (angular) ->
  angular.module 'track', []
  require './services/tracksManager.js'
  require './services/trackStore.js'
  require './services/confManager.js'
