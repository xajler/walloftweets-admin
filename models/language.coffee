mongoose = require 'mongoose'
Schema = mongoose.Schema

Language = new Schema(
  name: String
  nativeName: String
  cultureCode: String
  Position: Number
)

Language.path('name').validate (property) ->
  property.length <= 32

Language.path('nativeName').validate (property) ->
  property.length <= 32

Language.path('cultureCode').validate (property) ->
  property.length <= 7