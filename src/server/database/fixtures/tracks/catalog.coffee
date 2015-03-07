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
  {
    layout_compatibility: ['months']
    track_compatibility: ['heatmap', 'histogram']
    title: 'Temperatures in Paris in 2014'
    group: 'Temperature'
    description: 'Temperatures in Paris in 2014'
    source: 'http://www.wunderground.com/personal-weather-station/dashboard?ID=I75003PA1#history/s20121230/e20131231/myear'
    version: '1'
    data: require('./data/temperature_paris_2014.js').data
    conf:
      colorPalette: 'Spectral'
      colorPaletteSize: 10
      colorPaletteReverse: true
      min: -10
      max: 30
  }
  {
    layout_compatibility: ['months']
    track_compatibility: ['heatmap', 'histogram']
    title: 'Temperatures in Paris in 2013'
    group: 'Temperature'
    description: 'Temperatures in Paris in 2013'
    source: 'http://www.wunderground.com/personal-weather-station/dashboard?ID=I75003PA1#history/s20121230/e20131231/myear'
    version: '1'
    data: require('./data/temperature_paris_2013.js').data
    conf:
      colorPalette: 'Spectral'
      colorPaletteSize: 10
      colorPaletteReverse: true
      min: -10
      max: 30
  }
  {
    layout_compatibility: ['months']
    track_compatibility: ['heatmap', 'histogram']
    title: 'Temperatures in Paris in 2012'
    group: 'Temperature'
    description: 'Temperatures in Paris in 2012'
    source: 'http://www.wunderground.com/personal-weather-station/dashboard?ID=I75003PA1#history/s20121230/e20131231/myear'
    version: '1'
    data: require('./data/temperature_paris_2012.js').data
    conf:
      colorPalette: 'Spectral'
      colorPaletteSize: 10
      colorPaletteReverse: true
      min: -10
      max: 30
  }
  {
    layout_compatibility: ['months']
    track_compatibility: ['heatmap', 'histogram']
    title: 'Temperatures in Paris in 2011'
    group: 'Temperature'
    description: 'Temperatures in Paris in 2011'
    source: 'http://www.wunderground.com/personal-weather-station/dashboard?ID=I75003PA1#history/s20121230/e20131231/myear'
    version: '1'
    data: require('./data/temperature_paris_2011.js').data
    conf:
      colorPalette: 'Spectral'
      colorPaletteSize: 10
      colorPaletteReverse: true
      min: -10
      max: 30
  }
  {
    layout_compatibility: ['months']
    track_compatibility: ['heatmap', 'histogram']
    title: 'Temperatures in Paris in 2010'
    group: 'Temperature'
    description: 'Temperatures in Paris in 2010'
    source: 'http://www.wunderground.com/personal-weather-station/dashboard?ID=I75003PA1#history/s20121230/e20131231/myear'
    version: '1'
    data: require('./data/temperature_paris_2010.js').data
    conf:
      colorPalette: 'Spectral'
      colorPaletteSize: 10
      colorPaletteReverse: true
      min: -10
      max: 30
  }
  {
    layout_compatibility: ['months']
    track_compatibility: ['heatmap', 'histogram']
    title: 'Temperatures in Paris in 2009'
    group: 'Temperature'
    description: 'Temperatures in Paris in 2009'
    source: 'http://www.wunderground.com/personal-weather-station/dashboard?ID=I75003PA1#history/s20121230/e20131231/myear'
    version: '1'
    data: require('./data/temperature_paris_2009.js').data
    conf:
      colorPalette: 'Spectral'
      colorPaletteSize: 10
      colorPaletteReverse: true
      min: -10
      max: 30
  }
  {
    layout_compatibility: ['months']
    track_compatibility: ['heatmap', 'histogram']
    title: 'Temperatures in Paris in 2008'
    group: 'Temperature'
    description: 'Temperatures in Paris in 2008'
    source: 'http://www.wunderground.com/personal-weather-station/dashboard?ID=I75003PA1#history/s20121230/e20131231/myear'
    version: '1'
    data: require('./data/temperature_paris_2008.js').data
    conf:
      colorPalette: 'Spectral'
      colorPaletteSize: 10
      colorPaletteReverse: true
      min: -10
      max: 30
  }
  {
    layout_compatibility: ['months']
    track_compatibility: ['heatmap', 'histogram']
    title: 'Temperatures in Paris in 2007'
    group: 'Temperature'
    description: 'Temperatures in Paris in 2007'
    source: 'http://www.wunderground.com/personal-weather-station/dashboard?ID=I75003PA1#history/s20121230/e20131231/myear'
    version: '1'
    data: require('./data/temperature_paris_2007.js').data
    conf:
      colorPalette: 'Spectral'
      colorPaletteSize: 10
      colorPaletteReverse: true
      min: -10
      max: 30
  }
]
