User = require '../models/user'
users = require '../repositories/users'
mongoose = require 'mongoose'
should = require 'should'

describe 'Users Repository:', ->
  before ->
    mongoose.connect('mongodb://localhost/walloftweets')
    User.where('email', 'xajler@uxpassion.com').findOne((err, user) ->
      if user then user.remove()
    )

  it 'should find User by valid email', (done) ->
    users.findByEmail 'xajler@gmail.com', (user) ->
      user.firstName.should.equal 'Kornelije'
      user.firstName.should.not.equal 'Kornelije222'
      done()

  it 'should not find User by wrong email', (done) ->
    users.findByEmail 'xajle@gmail.com', (user) ->
      should.not.exist user
      done()

  it 'should authenticate User with proper email and password', (done) ->
    users.authenticate 'xajler@gmail.com', 'abc', (user) ->
      user.firstName.should.equal 'Kornelije'
      user.firstName.should.not.equal 'Kornelije222'
      done()

  it 'should not authenticate User with wrong email', (done) ->
    users.authenticate 'xajle@gmail.com', 'abc', (user) ->
      should.not.exist user
      done()
  it 'should not authenticate User with wrong password', (done) ->
    users.authenticate 'xajler@gmail.com', 'abc123', (user) ->
      should.not.exist user
      done()

  it 'should not authenticate User with wrong email and password', (done) ->
    users.authenticate 'xajle@gmail.com', 'abc123', (user) ->
      should.not.exist user
      done()

  it 'should save valid User model', (done) ->
    user = new User
    user.email = 'xajler@uxpassion.com'
    user.password = 'abc'
    user.salt = 'U37^$5g%'
    user.firstName = 'Kornelije'
    user.lastName = 'Sajler'

    users.save user, (isDone) ->
      isDone.should.equal yes
      done()

  it 'should not save User with existing email', (done) ->
    user = new User
    user.email = 'xajler@uxpassion.com'
    user.password = 'abc'
    user.salt = 'U37^$5g%'
    user.firstName = 'Kornelije'
    user.lastName = 'Sajler'

    users.save user, (isDone) ->
      isDone.should.equal no
      done()

  after ->
    mongoose.disconnect()