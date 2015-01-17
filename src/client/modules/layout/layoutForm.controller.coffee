do (angular) ->
  angular.module('layout').controller 'layoutCtrl', ($scope, layoutStore, circosJS) ->
    $scope.data = 
      selectedLayout: null
    #todo: use default layout conf of circosJS
    $scope.conf = angular.copy circosJS.Layout.prototype._defaultConf

    $scope.conf.labels.size = 14
    $scope.conf.ticks.labelSize = 10
    $scope.conf.innerRadius = 200
    $scope.conf.outerRadius = 230
    $scope.conf.labels.radialOffset = 10
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

    $scope.selectLayout = ->
      layoutStore.getLayout $scope.data.selectedLayout._id, (layout) ->
        $scope.layout = layout
        $scope.render()
    $scope.render = ->
      conf = angular.copy($scope.conf)
      conf.labels.size = conf.labels.size.toString() + 'px' 
      conf.ticks.labels.size = conf.ticks.labelSize.toString() + 'px' 
      conf.clickCallback = ->
        layoutFormService.toggleForm()
      circosJS.easyCircos.layout(conf, $scope.layout.data).render()
      
    # initialisation, get GRCh37 layout
    layoutStore.getLayoutByCode 'GRCh37', (layout) ->
        $scope.layout = layout
        $scope.render()
    
    
    
    $scope.labelAlignement = null
    $scope.test = ->
      console.log $scope.labelAlignement
