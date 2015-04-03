do (angular) ->
  angular.module('news').controller 'notificationHistoryCtrl', ($scope, $modalInstance, CircosNotification) ->
    now = Date.now()

    getTimelapse = (time) ->
      if now - time < 1000 * 60
        return '1 minute ago'
      else if now - time < 1000 * 60 * 60
        return (Math.floor((now - time)/(60*1000))).toString() + ' minutes ago'
      else if time - now < 1000 * 60 * 60 * 24
        return (Math.floor((now - time)/(60*1000*24))).toString() + ' hours ago'
      else
        'long time ago'


    $scope.notifications = CircosNotification.elements.map (note) ->
      timelapse: getTimelapse note.time
      message: note.message
      level: note.level
      code: note.code

    $scope.cancel = ->
      $modalInstance.dismiss 'cancel'
