do (angular) ->
  angular.module('news').controller 'newsCtrl', ($scope, $modalInstance, $resource) ->
    News = $resource '/news'
    News.query (news) ->
      aa = news
      result = news.map (note) ->
        date = new Date note.date
        date: date.getFullYear() + '-' + date.getMonth() + '-' + date.getDate()
        message: note.message
      $scope.news = result

    $scope.cancel = ->
      $modalInstance.dismiss 'cancel'
