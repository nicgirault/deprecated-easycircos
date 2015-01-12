do (angular) ->
  angular.module('help').factory 'helpStore', ->
    heatmapData:
      '.yml': '''Your YAML file should looks like this:<br />
<pre>
- parent: "chr1"
  data:
    - start: 1
      end: 10
      value: 7
    - start: 11
      end: 20
      value: 3
- parent: "chr2"
  data:
    - start: 1
      end: 10
      value: 7
...
</pre>
'''
      '.csv': '''Your csv file should looks like this: <br />
<pre>
chr1,1,10,7
chr1,11,20,3
chr2,1,10,7
...
</pre>
'''
    min: 'min/max: the range of the plot axis, data outside this range are clipped. If you do not specify the axis range using min/max values, then the axis will be scaled to span the full range of the data.'
    max: 'min/max: the range of the plot axis, data outside this range are clipped. If you do not specify the axis range using min/max values, then the axis will be scaled to span the full range of the data.'
