Auth = require '../utils/auth'
User = require '../models/user'
mongoose = require 'mongoose'

mongoose.connect('mongodb://localhost/walloftweets')

User = mongoose.model('User', User) 

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

save = (user) ->
  console.log user
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

module.exports.authenticate = authenticate
module.exports.save = save
module.exports.createDefaultUser = createDefaultUser  