exports.data = [
  {
    layout_compatibility: ['GRCh37']
    track_compatibility: ['heatmap']
    title: 'Repartition of SNPs in Stem cells'
    description: 'Repartition of SNPs in Stem cells'
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