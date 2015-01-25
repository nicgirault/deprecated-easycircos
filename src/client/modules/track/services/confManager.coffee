do (angular) ->
  angular.module('track').factory 'confManager', (circosJS) ->
    getConf: (trackId, trackType) ->
      if trackId == 'layout'
          return angular.copy circosJS.easyCircos._layout._conf

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

    getData: (trackId, trackType) ->
      if trackId == 'layout'
          return angular.copy circosJS.easyCircos._layout._data
      if trackType == 'heatmap'
        return angular.copy circosJS.easyCircos._heatmaps[ trackId ]._data
      if trackType == 'chords'
        return angular.copy circosJS.easyCircos._chords[ trackId ]._data
