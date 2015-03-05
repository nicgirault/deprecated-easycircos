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

  return {
    Layout: mongoose.model 'Layout', layoutSchema
    Track: mongoose.model 'Track', TrackSchema
  }
