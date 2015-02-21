do (angular) ->
  angular.module('layout').controller 'layoutCtrl', ($scope, layoutStore, tracks, defaults, helpStore, dataParser, $modal) ->
    tracks.getCurrentTrack (layout) ->
      $scope.layout = layout
      $scope.layout.conf.labels.size = 14
      $scope.layout.conf.ticks.labelSize = 10
      # innerRadius: 150
      # outerRadius: 250
      # gap: 0.04
      # labels:
      #   position: 'center'
      #   display: false
      #   size: 14
      #   color: '#000'
      #   radialOffset: 20
      # ticks:
      #   display: false
      #   color: 'grey'
      #   spacing: 10000000
      #   labels: false
      #   labelSpacing: 10
      #   labelSuffix: 'Mb'
      #   labelDenominator: 1000000
      #   labelDisplay0: true
      #   labelSize: 10
      #   labelColor: '#000'
      #   labelFont: 'default'
      #   majorSpacing: 5
      #   size:
      #     minor: 2
      #     major: 5
      # cornerRadius: 10

      # get the list of available layouts on server

      # si pas de data: on initialize

      # sinon:
        # on regarde si il y a un library id.

      $scope.layouts = []
      layoutStore.getStore (layouts) ->
        $scope.layouts = layouts

        if $scope.layout.data.length == 0
          for layout in layouts
            if layout.default
              $scope.selected =
                layout: layout
              break
          layoutStore.getLayout $scope.selected.layout._id, (layoutDoc) ->
            buffer = $scope.layout.conf
            $scope.layout = layoutDoc
            $scope.layout.conf = defaults(layoutDoc.conf, buffer)
            tracks.layout.library_id = layoutDoc._id
            $scope.render()
        else
          if tracks.layout.library_id?
            for layout in layouts
              if layout._id == tracks.layout.library_id
                $scope.selected =
                  layout: layout
                break
            layoutStore.getLayout $scope.selected.layout._id, (layoutDoc) ->
              buffer = $scope.layout.conf
              $scope.layout = layoutDoc
              $scope.layout.conf = defaults(layoutDoc.conf, buffer)
              $scope.render()

    $scope.data = dataParser
    $scope.parseData = ($fileContent) ->
      dataParser.parse($fileContent, (parsedData) ->
        $scope.layout.data = parsedData
        $scope.render(true)
      )

    $scope.selectLayout = ->
      layoutStore.getLayout $scope.selected.layout._id, (layout) ->
        buffer = $scope.layout.conf
        $scope.layout = layout
        $scope.layout.conf = defaults(layout.conf, buffer)
        tracks.layout.library_id = layout._id
        $scope.render(true)

    $scope.render = (removeTracks) ->
      conf = angular.copy($scope.layout.conf)
      conf.labels.size = conf.labels.size.toString() + 'px'
      conf.ticks.labels.size = conf.ticks.labelSize.toString() + 'px'
      circosJS.easyCircos.layout(conf, $scope.layout.data).render(['layout'], removeTracks)

      if removeTracks
        tracks.deleteAll()

    $scope.showLayoutDataModal = ->
      modalInstance = $modal.open
        templateUrl: 'modules/help/layoutData.modal.html'
        controller: 'ModalCancelCtrl'
        backdrop: true

    $scope.labelAlignement = null
    $scope.help = helpStore
