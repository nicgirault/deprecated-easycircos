exports.init = (app, Proposition) ->
  app.post '/proposition', (req, res) ->
    proposition = new Proposition {
      name: req.body.name
      data: req.body.data
      type: req.body.type
      details: req.body.details
      conf: req.body.conf
      userMeta: req.body.userMeta
      date: new Date()
    }

    proposition.save (err) ->
      res.send err

  app.get '/proposition', (req, res) ->
    Proposition.find().select('name type details date userMeta').sort({date: -1}).lean().exec (err, docs) ->
      if err
        res.send err
      else
        res.send docs
