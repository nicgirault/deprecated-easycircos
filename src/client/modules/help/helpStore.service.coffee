do (angular) ->
  angular.module('help').factory 'helpStore', ->
    min: 'min/max: the range of the plot axis, data outside this range are clipped. If you do not specify the axis range using min/max values, then the axis will be scaled to span the full range of the data.'
    max: 'min/max: the range of the plot axis, data outside this range are clipped. If you do not specify the axis range using min/max values, then the axis will be scaled to span the full range of the data.'
