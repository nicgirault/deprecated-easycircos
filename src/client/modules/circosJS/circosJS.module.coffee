module.exports = do(angular, circosJS) ->
  angular.module 'circosJS', ['circos-notification', 'easyCircos.config']

  angular.module('circosJS').factory 'circosJS', (CircosNotification, NOTIFICATION_DELAY) ->
    size = Math.min window.innerHeight, window.innerWidth
    size = size - 60

    circosJS.log = (level, code, message, data) ->
      if code == 'undefinedParentId'
        layout_ids = (d.id for d in circosJS.easyCircos._layout.getData())
        message = '"' + data.block_id + '" is not one of ' + layout_ids.join ', '
        CircosNotification.add message, code, 1
      else if code in ['datum', 'start', 'end', 'value']
        message = '"' + data.value + '" is not a number line ' + data.line
        CircosNotification.add message, code, 1
      else
        CircosNotification.add message, code, 2

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
    circosJS.size = size
    circosJS
