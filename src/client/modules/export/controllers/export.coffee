do (angular) ->
  angular.module('export').controller 'exportCtrl', ($scope, $modalInstance, helpStore, circosJS) ->
    $scope.help = helpStore
    svgContent = d3.select("svg")
      .attr("version", 1.1)
      .attr("xmlns", "http://www.w3.org/2000/svg")
      .node().parentNode.innerHTML
    svg = new Blob([svgContent], {type: 'image/svg+xml;charset=utf-8'});

    # TODO: régler le pb d'asynchronisme: ce code devrait être dans le exportPng
    ####
    canvas = document.getElementById('canvas')
    canvas.width = circosJS.size
    canvas.height = circosJS.size
    ctx = canvas.getContext('2d')

    DOMURL = window.URL || window.webkitURL || window

    img = new Image()
    url = DOMURL.createObjectURL(svg)

    img.onload = ->
      ctx.drawImage(img, 0, 0, circosJS.size, circosJS.size)
      DOMURL.revokeObjectURL(url)
    img.src = url
    ####
    
    $scope.exportSvg = ->
      saveAs(svg, 'circos.svg');

    $scope.exportPng = ->
      canvas.toBlob (blob) ->
        saveAs(blob, 'circos.png')

    $scope.cancel = ->
      $modalInstance.dismiss 'cancel'
