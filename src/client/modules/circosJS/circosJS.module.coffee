module.exports = do(angular, circosJS) ->
  angular.module 'circosJS', []

  angular.module('circosJS').factory 'circosJS', (Notification, $timeout, NOTIFICATION_DELAY) ->
    size = Math.min window.innerHeight, window.innerWidth
    size = size - 60

    circosJS.log = (level, code, message, data) ->
      # 0 - permanent
      # 1 - error
      # 2 - warning
      # 3 - info
      # 4 - debug
      levels = ['info', 'error', 'warning', 'info']
      if code == 'undefinedParentId'
        layout_ids = (d.id for d in circosJS.easyCircos._layout.getData())
        message = '"' + data.block_id + '" is not one of ' + layout_ids.join ', '
        Notification
          message: message
          delay: NOTIFICATION_DELAY
        , levels[1]
      else if code in ['datum', 'start', 'end', 'value']
        message = '"' + data.value + '" is not a number line ' + data.line
        Notification
          message: message
          delay: NOTIFICATION_DELAY
        , levels[1]
      else
        Notification.warning
          message: message
          delay: NOTIFICATION_DELAY

    circosJS.easyCircos = new circosJS
      width: size
      height: size
      container: '#chart'
    circosJS.easyCircos.layout({
      innerRadius: 200
      outerRadius: 230
      labels:
        radialOffset: 10
        display: true
    },[])
    circosJS
