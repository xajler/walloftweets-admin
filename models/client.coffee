#### Requires
# * The MongoDB ODM driver **Mongoose**.
# * **Mongoose** `Schema`.
mongoose = require 'mongoose'
Schema = mongoose.Schema

#### Client
# The new Mongoose `Schema` of Wall Of Tweets Client model.
Client = new Schema(
  #### name
  # `String` type, required, MongoDB index.
  name:
    type: String
    index: true
    required: true

  #### email
  # `String` type, required, Unique MongoDB index.
  email:
    type: String
    required: true
    unique: true
    validate: /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/

  #### contactPersonName
  contactPersonName: String
  #### address
  address: String
  #### country
  country: String
  #### telephone
  telephone: String
  #### mobile
  mobile: String
  #### isActive
  # `Boolean` type, Set to `true` as default value.
  isActive:
    type: Boolean
    default: true
  #### isDeleted
  # `Boolean` type, Set to `false` as default value.
  isDeleted:
    type: Boolean
    default: false
  #### isUserWhitelistedForAllEvents
  # `Boolean` type, Set to `false` as default value.
  isUserWhitelistedForAllEvents:
    type: Boolean 
    default: false
  #### isUserBlacklistedForAllEvents
  # `Boolean` type, Set to `false` as default value.
  isUserBlacklistedForAllEvents:
    type: Boolean
    default: false
  #### isWordBlacklistedForAllEvents
  # `Boolean` type, Set to `false` as default value.
  isWordBlacklistedForAllEvents:
    type: Boolean
    default: false
)

# Validates that Client `name` is of 64 characters.
Client.path('name').validate (property) ->
  property.length <= 64

# Validates that Client `email` is of 128 characters.
Client.path('email').validate (property) ->
  property.length <= 128

# Exports `Client` Mongoose module as module.
module.exports = mongoose.model('Client', Client)