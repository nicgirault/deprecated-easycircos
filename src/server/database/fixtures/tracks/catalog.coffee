exports.data = [
  {
    layout_compatibility: ['GRCh37']
    track_compatibility: ['heatmap']
    title: 'example 1'
    description: 'An example to see how easy circos can render data'
    source: 'SeaDB'
    version: '2015-01-20'
    data: require('./data/seadb.js').data
    conf:
      min: 0
      max: 50
      colorPalette: 'Blues'
      colorPaletteSize: 9
  }
]