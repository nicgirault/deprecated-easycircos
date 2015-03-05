exports.data = [
  {
    layout_compatibility: ['GRCh37']
    track_compatibility: ['heatmap', 'histogram']
    title: 'Test 1'
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
  {
    layout_compatibility: ['GRCh37']
    track_compatibility: ['heatmap', 'histogram']
    title: 'Range'
    group: 'Test'
    description: 'Dummy data for testing'
    source: 'Easy Circos'
    version: '2015-01-20'
    data: require('./data/range.js').data
    conf:
      colorPalette: 'Blues'
      colorPaletteSize: 9
  }
  {
    layout_compatibility: ['months']
    track_compatibility: ['heatmap', 'histogram']
    title: 'Electrical consumption in France in 2014'
    group: 'Energy'
    description: 'The electrical consumption in France in 2014'
    source: 'RTE - http://clients.rte-france.com/lang/fr/visiteurs/vie/vie_stats_conso_jour.jsp'
    version: '1'
    data: require('./data/2014_electric_consumption.js').data
    conf:
      colorPalette: 'YlOrRd'
      colorPaletteSize: 9
  }
  {
    layout_compatibility: ['months']
    track_compatibility: ['heatmap']
    title: 'Weekends and hollidays in 2014 in France'
    group: 'Time'
    description: 'Weekends and hollidays in 2014 in France'
    source: 'Easy Circos'
    version: '1'
    data: require('./data/2014_hollidays.js').data
    conf:
      colorPalette: 'Blues'
      colorPaletteSize: 9
  }
]
