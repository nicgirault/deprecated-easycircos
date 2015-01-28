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
            angular.copy(circosJS.easyCircos._layout._conf),
            circosJS.Layout.prototype._defaultConf
          )

      if trackType == 'heatmap'
        if trackId of circosJS.easyCircos._heatmaps
          return angular.copy circosJS.easyCircos._heatmaps[ trackId ]._conf
        else
          return angular.copy circosJS.Heatmap.prototype._defaultConf

      if trackType == 'chords'
        if trackId of circosJS.easyCircos._chords
          return angular.copy circosJS.easyCircos._chords[ trackId ]._conf
        else
          return angular.copy circosJS.Chord.prototype._defaultConf

      if trackType == 'histogram'
        if trackId of circosJS.easyCircos._histograms
          return angular.copy circosJS.easyCircos._histograms[ trackId ]._conf
        else
          return angular.copy circosJS.Histogram.prototype._defaultConf

    getData: (trackId, trackType) ->
      if trackId == 'layout'
          return angular.copy circosJS.easyCircos._layout._data
      if trackType == 'heatmap'
        return angular.copy circosJS.easyCircos._heatmaps[ trackId ]._data
      if trackType == 'chords'
        return angular.copy circosJS.easyCircos._chords[ trackId ]._data
      if trackType == 'histogram'
        return angular.copy circosJS.easyCircos._histograms[ trackId ]._data
