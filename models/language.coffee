#### Requires
# * The MongoDB ODM driver **Mongoose**.
# * **Mongoose** `Schema`.
mongoose = require 'mongoose'
Schema = mongoose.Schema

#### Language
# The new Mongoose `Schema` of Language model.
Language = new Schema(
  #### name
  name: String
  #### nativeName
  nativeName: String
  #### cultureCode (IETF tag code e.g en-US)
  cultureCode: String
  #### position
  position: Number
)

# Validates that Language `name` is 32 characters long.
Language.path('name').validate (property) ->
  property.length <= 32

# Validates that Language `nativeName` is 32 characters long.
Language.path('nativeName').validate (property) ->
  property.length <= 32

# Validates that Language `cultureCode` is 7 characters long.
Language.path('cultureCode').validate (property) ->
  property.length <= 7

# Exports `Language` Mongoose module as module.
module.exports = mongoose.model('Language', Language)