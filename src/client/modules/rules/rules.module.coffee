module.exports = do(angular) ->
  angular.module 'rules', []

  require './controllers/modal.js'
  require './services/rulesManager.js'
