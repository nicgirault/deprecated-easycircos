exports.import = (model) ->
  model.Layout.create require('./layouts/catalog.js').data
