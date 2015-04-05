exports.init = (app, Layout) ->
  app.get '/layout', (req, res) ->
    Layout.find().select('title description source version default category code').lean().exec (err, docs) ->
      if err
        res.send err
      else
        res.send docs

  app.get '/layout/:id', (req, res) ->
    if req.params.id == 'default'
      Layout.findOne(default: true).lean().exec (err, doc) ->
        if err
          res.send err
        else
          res.send doc
    else
      Layout.findById(req.params.id).lean().exec (err, doc) ->
        if err
          res.send err
        else
          res.send doc
