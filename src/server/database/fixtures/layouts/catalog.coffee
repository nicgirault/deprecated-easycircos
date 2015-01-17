exports.data = [
  {
    category:
      field: 'genomics'
      type: 'karyotype'
      species: 'Homo Sapiens'
    title: 'Homo Sapiens GRCh37 - hg19'
    code: 'GRCh37'
    description: 'Human genome with cytobands'
    source: 'Circos v0.64'
    version: 'GRCh37'
    data: require('./data/GRCh37.js').data
  }
]