exports.init = (app, Track) ->
  app.get '/layout/:layoutCode/tracks/:trackType', (req, res) ->
    Track.find({
      track_compatibility: req.params.trackType
      layout_compatibility: req.params.layoutCode
    })
    .select('title description source version group').lean().exec (err, docs) ->
      if err
        res.send err
      else
        res.send docs

  app.get '/track/:id', (req, res) ->
    Track.findById(req.params.id).lean().exec (err, doc) ->
      if err
        res.send err
      else
        res.send doc
