do (angular) ->
  angular.module('trackManager').controller 'editTrackDataCtrl', ($scope, $modalInstance, type, data, helpStore) ->
    $scope.help = helpStore
    if data
      $scope.dataString = data.map (datum) ->
        datum.join(',')
      .join('\n')

    if type in ['heatmap', 'histogram', 'tiles']
      $scope.header = 'layout_block_id,start_position,end_position,value'
    else if type in ['line', 'scatter']
      $scope.header = 'layout_block_id,position,value'
    else if type == 'chords'
      $scope.header = 'source_id,source_start_position,source_end_position,target_id,target_start_position,target_end_position,value'
    else if type == 'highlight'
      $scope.header = 'layout_block_id,start_position,end_position,color'

    $scope.cancel = ->
      $modalInstance.dismiss 'cancel'
    $scope.save = ->
      $modalInstance.close $scope.dataString
