exports.data = [
  {
    layout_compatibility: ['GRCh37']
    track_compatibility: ['heatmap', 'histogram']
    title: 'Heatmap 1'
    group: 'Test'
    description: 'Dummy data for testing'
    source: 'Easy Circos'
    version: '2015-01-20'
    data: require('./data/seadb.js').data
    conf:
      min: 0
      max: 50
      colorPalette: 'Blues'
      colorPaletteSize: 9
  }
  {
    layout_compatibility: ['GRCh37']
    track_compatibility: ['chords']
    title: 'Chords 1'
    group: 'Test'
    description: 'Dummy data for testing'
    source: 'Easy Circos'
    version: '2015-01-20'
    data: require('./data/chords.js').data
    conf:
      colorPalette: 'Blues'
      colorPaletteSize: 9
  }
]