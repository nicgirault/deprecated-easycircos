angular.module('circosJS').factory 'CircosNotification', (Notification, NOTIFICATION_DELAY, $rootScope) ->
  levels = ['info', 'error', 'warning', 'info']

  Notification.elements = []
  Notification.add = (message, code, level) ->
    lastNotification = Notification.elements[0] || {code: null, message: null}
    unless lastNotification.code == code and lastNotification.message == message
      Notification.elements.unshift {code: code, message: message, level: levels[level], time: Date.now()}
      Notification
        message: message
        delay: NOTIFICATION_DELAY
      , levels[level]
    $rootScope.$broadcast 'new-notification'
  Notification
