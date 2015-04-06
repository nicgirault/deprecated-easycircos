do (angular) ->
  angular.module('trackManager').controller 'editTrackDataCtrl', ($scope, $modalInstance, type, data, helpStore) ->
    if data
      $scope.dataString = data.map (datum) ->
        datum.join(',')
      .join('\n')

    if type in ['heatmap', 'histogram']
      $scope.header = 'layout_block_id,start_position,end_position,value'
    if type in ['line', 'scatter']
      $scope.header = 'layout_block_id,position,value'
    if type == 'chords'
      $scope.header = 'source_id,source_start_position,source_end_position,target_id,target_start_position,target_end_position,value'

    $scope.cancel = ->
      $modalInstance.dismiss 'cancel'
    $scope.save = ->
      $modalInstance.close $scope.dataString
