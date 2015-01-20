exports.init = (app, Track) ->
  app.get '/tracks', (req, res) ->
    Track.find().select('title description source version layout_compatibility track_compatibility').lean().exec (err, docs) ->
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
