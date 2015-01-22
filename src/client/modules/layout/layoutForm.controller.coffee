do (angular) ->
  angular.module('layout').controller 'layoutCtrl', ($scope, layoutStore, circosJS, defaults, helpStore) ->
    defaultConf = angular.copy circosJS.Layout.prototype._defaultConf
    defaultConf.labels.size = 14
    defaultConf.ticks.labelSize = 10
    defaultConf.innerRadius = 200
    defaultConf.outerRadius = 230
    defaultConf.labels.radialOffset = 10
    defaultConf.labels.display = true
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
    $scope.layouts = []
    layoutStore.getStore (layouts) ->
      $scope.layouts = layouts

      for layout in layouts
        if layout.default
          $scope.data =
              selectedLayout: layout
          layoutStore.getLayout layout._id, (layoutDoc) ->
            $scope.layout = layoutDoc
            $scope.conf = defaults(layoutDoc.conf, defaultConf)
            $scope.render()
    

    $scope.selectLayout = ->
      layoutStore.getLayout $scope.data.selectedLayout._id, (layout) ->
        $scope.layout = layout
        $scope.conf = defaults(layout.conf, defaultConf)
        $scope.render()
    $scope.render = ->
      conf = angular.copy($scope.conf)
      conf.labels.size = conf.labels.size.toString() + 'px' 
      conf.ticks.labels.size = conf.ticks.labelSize.toString() + 'px' 
      circosJS.easyCircos.layout(conf, $scope.layout.data).render()
      
    $scope.labelAlignement = null
    $scope.help = helpStore
