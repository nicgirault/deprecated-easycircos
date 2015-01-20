exports.model = (mongoose) ->
  layoutSchema = mongoose.Schema
    category: Object
    title: String
    description: String
    source: String
    version: String
    data: Object
    default: Boolean
    conf: Object

  return {
    Layout: mongoose.model 'Layout', layoutSchema
  }
