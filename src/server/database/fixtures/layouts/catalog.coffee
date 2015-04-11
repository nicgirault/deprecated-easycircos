exports.data = [
  {
    category:
      field: 'general'
    title: 'New layout from scratch'
    code: 'new'
    default: false
    description: 'Click on "edit" to describe the layout'
    source: null
    version: null
    data: []
    conf:
      labels:
        radialOffset: -15
      ticks:
        display: false
        spacing: 1
        labels: false
        labelSuffix: ''
        labelDenominator: 1
  }
  {
    category:
      field: 'genomics'
      type: 'karyotype'
      species: 'Homo Sapiens'
    title: 'Homo Sapiens GRCh37 - hg19'
    code: 'GRCh37'
    default: true
    description: 'Human genome with cytobands'
    source: 'Circos v0.64'
    version: 'GRCh37'
    data: require('./data/GRCh37.js').data
    conf:
      ticks:
        display:false
      gap: 0.04
      cornerRadius: 0
  }
  {
    category:
      field: 'maths'
    title: 'Digits'
    code: 'digits'
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
    code: 'months'
    title: 'Months'
    default: false
    description: 'Months to display data over the year. Each month has a length equal to the number of days in the month.'
    source: 'N/A'
    version: '1'
    data: require('./data/months.js').data
    conf:
      cornerRadius: 2
      ticks:
        display: false
        spacing: 1,
        labels: false,
        labelSpacing: 10,
        labelSuffix: '',
        labelDenominator: 1,
        labelDisplay0: false,
        labelSize: 10,
        labelColor: '#000000',
        labelFont: 'default',
        majorSpacing: 10,
        size:
          minor: 2,
          major: 4,
  }
  {
    category:
      field: 'time'
    title: 'Weekdays'
    code: 'weekdays'
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
    code: 'hours'
    default: false
    description: 'Hours to display data over the day. Each hour has length 60'
    source: 'N/A'
    version: '1'
    data: require('./data/hours.js').data
    conf:
      labels:
        radialOffset: -15
      ticks:
        display: false
        spacing: 10
        labels: false

  }
]
