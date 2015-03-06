do (angular) ->
  angular.module('layoutInit').run (tracks, layoutStore, circosJS) ->
    layoutStore.getDefaultLayout (layout) ->
      tracks.layout.code = layout.code
      circosJS.easyCircos.layout(layout.conf, layout.data).render(['layout'])
