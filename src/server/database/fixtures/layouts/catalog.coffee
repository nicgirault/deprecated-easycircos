exports.data = [
  {
    category:
      field: 'genomics'
      type: 'karyotype'
      species: 'Homo Sapiens'
    title: 'Homo Sapiens GRCh37 - hg19'
    default: true
    description: 'Human genome with cytobands'
    source: 'Circos v0.64'
    version: 'GRCh37'
    data: require('./data/GRCh37.js').data
    conf:
      gap: 0.04
  }
  {
    category:
      field: 'maths'
    title: 'Digits'
    default: false
    description: 'Digits to play with arithmetic'
    source: ''
    version: '1'
    data: require('./data/digits.js').data
    conf:
      ticks:
        display: false
  }
  {
    category:
      field: 'time'
    title: 'Months'
    default: false
    description: 'Months to display data over the year. Each month has a length equal to the number of days in the month.'
    source: 'N/A'
    version: '1'
    data: require('./data/months.js').data
    conf:
      ticks:
        display: false
  }
  {
    category:
      field: 'time'
    title: 'Weekdays'
    default: false
    description: 'Weekdays to display data over the week. Each day has length 24'
    source: 'N/A'
    version: '1'
    data: require('./data/weekdays.js').data
    conf:
      ticks:
        display: false
  }
  {
    category:
      field: 'time'
    title: 'Hours'
    default: false
    description: 'Hours to display data over the day. Each hour has length 60'
    source: 'N/A'
    version: '1'
    data: require('./data/hours.js').data
    conf:
      labels:
        radialOffset: -15
      ticks:
        display: true
        spacing: 1
        labels: false

  }
]