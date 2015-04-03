module.exports = do(angular, circosJS) ->
  angular.module 'circos-notification', ['ui-notification', 'easyCircos.config']

  require './controllers/notificationHistory.js'
  require './services/circosNotification.js'
