do (angular) ->
  angular.module('help').factory 'helpStore', ->
    layoutMenu: 'This is the layout menu. You can select a layout or import yours in the data tab. In the other tabs, you can design what should look like the layout circle.'
    min: 'min/max: the range of the plot axis, data outside this range are clipped. If you do not specify the axis range using min/max values, then the axis will be scaled to span the full range of the data.'
    max: 'min/max: the range of the plot axis, data outside this range are clipped. If you do not specify the axis range using min/max values, then the axis will be scaled to span the full range of the data.'
    interpolation: 'how points are linked to each others'
    linear: 'piecewise linear segments, as in a polyline'
    basis: 'a B-spline, with control point duplication on the ends'
    cardinal: 'a Cardinal spline, with control point duplication on the ends'
    monotone: 'cubic interpolation that preserves monotonicity in y'
