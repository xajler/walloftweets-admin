#### Requires
#
# * `auth` helper utility for salting and hashing password.
# * The Mongoose model of `user`.
# * The MongoDB ODM driver **Mongoose**.
Auth = require '../utils/auth'
User = require '../models/user'
mongoose = require 'mongoose'

#### Authenticate
# For given email and password authenticates user aginst MongoDB user collection.
# Uses `auth` helper utility to hash the password and salt to validate user.  
# Returns a user as a callback.
authenticate = (email, password, callback) ->
  User.findOne 
    'email': email
  , (err, user) ->
    if err then console.log err else console.log user
    unless user
      console.log email + ' ' + password
      callback null

    auth = new Auth()

    if auth.validate(password, user.salt, user.password)
      callback user
      return
    callback null

#### Save
# Saves the given user to the MongoDB user collection.
save = (user) ->
  user.save (err) ->
    if err then throw err else console.log 'User saved!'

# Exports `authenticate` as module.
module.exports.authenticate = authenticate

# Exports `save` as module.
module.exports.save = save