exports.init = (app, Layout) ->
  app.get '/layouts', (req, res) ->
    Layout.find().select('title description source version').lean().exec (err, docs) ->
      if err
        res.send err
      else
        res.send docs

  app.get '/layout/:id', (req, res) ->
    Layout.findById(req.params.id).lean().exec (err, doc) ->
      if err
        res.send err
      else
        res.send doc
