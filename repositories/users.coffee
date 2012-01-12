#### Requires
#
# * `auth` helper utility for salting and hashing password.
# * The Mongoose model of `user`.
# * The MongoDB ODM driver **Mongoose**.
Auth = require '../utils/auth'
User = require '../models/user'
mongoose = require 'mongoose'

#### FindByEmail
# Finds the `User` by given email.
# Returns a `User` as a next callback.
findByEmail = (email, next) ->
  User.where('email', email).findOne((err, user) ->
    if user then next user else next null
  )

#### Authenticate
# For given email and password authenticates user aginst MongoDB user collection.
# Uses `auth` helper utility to hash the password and salt to validate user.  
# Returns a `User` as a next callback.
authenticate = (email, password, next) ->
  @findByEmail email, (user) ->
    if user
      auth = new Auth()

      if auth.validate(password, user.salt, user.password)
        return next user

    next null

#### Save
# Saves the given user to the MongoDB user collection.
# Returns the boolen when is done as next callback.
save = (user, next) ->
  user.save (err) ->
    if err then next no else next yes

# Exports `findByEmail` as module.
module.exports.findByEmail = findByEmail

# Exports `authenticate` as module.
module.exports.authenticate = authenticate

# Exports `save` as module.
module.exports.save = save