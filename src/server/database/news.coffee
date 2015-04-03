exports.init = (app, News) ->
  app.get '/news', (req, res) ->
    News.find().sort({date: -1}).lean().exec (err, docs) ->
      if err
        res.send err
      else
        res.send docs
