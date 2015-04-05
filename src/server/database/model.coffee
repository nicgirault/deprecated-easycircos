exports.model = (mongoose) ->
  layoutSchema = mongoose.Schema
    category: Object
    title: String
    code: String
    description: String
    source: String
    version: String
    data: Object
    default: Boolean
    conf: Object

  TrackSchema = mongoose.Schema
    layout_compatibility: [String]
    track_compatibility: [String]
    title: String
    group: String
    description: String
    source: String
    version: String
    data: Object
    conf: Object

  NewsSchema = mongoose.Schema
    date: Date
    message: String

  propositionSchema = mongoose.Schema
    name: String
    type: String # layout or tracktype
    details: String
    data: Object
    conf: Object
    userMeta: Object
    date: Date

  return {
    Layout: mongoose.model 'Layout', layoutSchema
    Track: mongoose.model 'Track', TrackSchema
    News: mongoose.model 'News', NewsSchema
    Proposition: mongoose.model 'Proposition', propositionSchema
  }
