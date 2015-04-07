do (angular) ->
  angular.module('track').factory 'defaults', ->
    defaults = (conf, defaultConf) ->
      newConf = {}
      for key, value of defaultConf
        if key of conf
          if typeof value == 'object'
            newConf[key] = defaults(conf[key], value)
          else
            newConf[key] = conf[key]
        else
          newConf[key] = value
      return newConf
    return defaults

  angular.module('track').factory 'confManager', (circosJS, defaults) ->
    getConf: (trackId, trackType) ->
      if trackId == 'layout'
          return defaults(
            angular.copy(circosJS.easyCircos._layout.conf),
            circosJS.Layout.prototype.defaultConf
          )

      if trackType == 'heatmap'
        if trackId of circosJS.easyCircos.tracks.heatmaps
          return angular.copy circosJS.easyCircos.tracks.heatmaps[ trackId ].conf
        else
          conf = angular.copy circosJS.Heatmap.prototype.defaultConf
          borders = circosJS.easyCircos.smartBorders()
          conf.innerRadius = borders.in
          conf.outerRadius = borders.out
          return conf

      if trackType == 'chords'
        if trackId of circosJS.easyCircos.tracks.chords
          return angular.copy circosJS.easyCircos.tracks.chords[ trackId ].conf
        else
          return angular.copy circosJS.Chord.prototype.defaultConf

      if trackType == 'histogram'
        if trackId of circosJS.easyCircos.tracks.histograms
          return angular.copy circosJS.easyCircos.tracks.histograms[ trackId ].conf
        else
          conf = angular.copy circosJS.Histogram.prototype.defaultConf
          borders = circosJS.easyCircos.smartBorders()
          conf.innerRadius = borders.in
          conf.outerRadius = borders.out
          return conf

      if trackType == 'scatter'
        if trackId of circosJS.easyCircos.tracks.scatters
          return angular.copy circosJS.easyCircos.tracks.scatters[ trackId ].conf
        else
          conf = angular.copy circosJS.Scatter.prototype.defaultConf
          borders = circosJS.easyCircos.smartBorders()
          conf.innerRadius = borders.in
          conf.outerRadius = borders.out
          return conf

      if trackType == 'line'
        if trackId of circosJS.easyCircos.tracks.lines
          return angular.copy circosJS.easyCircos.tracks.lines[ trackId ].conf
        else
          conf = angular.copy circosJS.Line.prototype.defaultConf
          borders = circosJS.easyCircos.smartBorders()
          conf.innerRadius = borders.in
          conf.outerRadius = borders.out
          return conf

      if trackType == 'tiles'
        if trackId of circosJS.easyCircos.tracks.stacks
          return angular.copy circosJS.easyCircos.tracks.stacks[ trackId ].conf
        else
          conf = angular.copy circosJS.Stack.prototype.defaultConf
          borders = circosJS.easyCircos.smartBorders()
          conf.innerRadius = borders.in
          conf.outerRadius = borders.out
          return conf

    getData: (trackId, trackType) ->
      if trackId == 'layout'
          return angular.copy circosJS.easyCircos._layout.data
      if trackType == 'heatmap'
        return angular.copy circosJS.easyCircos.tracks.heatmaps[ trackId ].data
      if trackType == 'chords'
        return angular.copy circosJS.easyCircos.tracks.chords[ trackId ].data
      if trackType == 'histogram'
        return angular.copy circosJS.easyCircos.tracks.histograms[ trackId ].data
      if trackType == 'scatter'
        return angular.copy circosJS.easyCircos.tracks.scatters[ trackId ].data
      if trackType == 'line'
        return angular.copy circosJS.easyCircos.tracks.lines[ trackId ].data
      if trackType == 'tiles'
        return angular.copy circosJS.easyCircos.tracks.tiles[ trackId ].data
