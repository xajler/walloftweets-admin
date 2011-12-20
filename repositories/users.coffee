#### Requires
#
# * `auth` helper utility for salting and hashing password.
# * The Mongoose model of `user`.
# * The MongoDB ODM driver **Mongoose**.
Auth = require '../utils/auth'
User = require '../models/user'
mongoose = require 'mongoose'

# Gets the Mongoose **User** model representation.
User = mongoose.model('User', User) 

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

createDefaultUser = ->
  user = new User
  user.email = 'xajler@gmail.com'
  user.salt = 'T%6ScZmQ'
  user.password = 'a7caacc44236c74f54571498c33977d3b5f63dec54ae1c095818308607c8302c'
  user.firstName = 'Kornelije'
  user.lastName = 'Sajler'
  save user

users =
  'xajler@gmail.com':
    email: 'xajler@gmail.com'
    salt: 'T%6ScZmQ'
    password: 'a7caacc44236c74f54571498c33977d3b5f63dec54ae1c095818308607c8302c'

# Exports the `authenticate` function.
module.exports.authenticate = authenticate 
# Exports the `save` method.
module.exports.save = save
module.exports.createDefaultUser = createDefaultUser  