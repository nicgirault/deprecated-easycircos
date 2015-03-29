exports.init = (app, News) ->
  app.get '/news', (req, res) ->
    News.find().lean().exec (err, docs) ->
      if err
        res.send err
      else
        res.send docs
