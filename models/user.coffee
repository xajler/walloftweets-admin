#### Requires
# * The MongoDB ODM driver **Mongoose**.
# * **Mongoose** `Schema`.
mongoose = require('mongoose')
Schema = mongoose.Schema

#### User 
# The new Mongoose `Schema` of Wall Of Tweets User model.
User = new Schema(
  #### email
  # `String` type, required, Unique MongoDB index.
  email:
    type: String
    required: true
    unique: true
    validate: /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
  #### password
  # Hashed password of salt and password hashed.
  # `String` type, required, MongoDB index.
  password:
    type: String
    index: true
    required: true
  #### salt
  # The salt for (un)hashing the password.
  salt: String
  #### firstName
  # `String` type, required, MongoDB index.
  firstName:
    type: String
    index: true
    required: true
  #### lastName
  # `String` type, required, MongoDB index.
  lastName:
    type: String
    index: true
    required: true
  #### role
  # The User role in application, available roles:
  #
  # * _Administrator_ - UXPassion personnel only!
  # * _Event Administrator_ - The admin of the event.
  #
  # The default role for user is _Event Administrator_.
  role:
    type: String
    enum: ['Administrator', 'Event Administrator']
    default: 'Event Administrator'
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
)

# Validates that User `fullName` is 32 characters long.
User.virtual('fullName').get ->
  this.firstName + this.lastName

# Validates that User `email` is 32 characters long.
User.path('email').validate (property) ->
  property.length <= 128

# Validates that User `firstName` is 32 characters long.
User.path('firstName').validate (property) ->
  property.length <= 32

# Validates that User `lastName` is 32 characters long.
User.path('lastName').validate (property) ->
  property.length <= 64

# Exports `User` Mongoose model as module.
module.exports = mongoose.model('User', User)