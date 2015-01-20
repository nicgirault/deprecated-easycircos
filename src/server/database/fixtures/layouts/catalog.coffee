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
  },
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
]