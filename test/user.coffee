User = require '../models/user'
should = require 'should'

describe 'User Model:', ->
  it 'should be instance of Object', ->
    user = new User
    user.should.be.an.instanceof Object

  it 'should be saved with given right and required data', ->
    user = new User
    user.email = 'xajler@gmail.com'
    user.password = 'abc'
    user.salt = 'U37^$5g%'
    user.firstName = 'Kornelije'
    user.lastName = 'Sajler'
    
    user.save
    
    user.email.should.equal 'xajler@gmail.com'
    user.password.should.equal 'abc'
    user.salt.should.equal 'U37^$5g%'
    user.firstName.should.equal 'Kornelije'
    user.lastName.should.equal 'Sajler'
    user.role.should.equal 'Event Administrator'
    user.isActive.should.equal true
    user.isDeleted.should.equal false
    user.fullName.should.equal 'Kornelije Sajler'

  it 'should not save User with not valid email', (done) ->
    user = new User
    user.email = 'xajlergmail.com'
    user.password = 'abc'
    user.salt = 'U37^$5g%'
    user.firstName = 'Kornelije'
    user.lastName = 'Sajler'

    user.save((err) ->
      if err
        err.should.throw()
        done()
    )

  it 'should not save User without email', (done) ->
    user = new User
    user.email = ''
    user.password = 'abc'
    user.salt = 'U37^$5g%'
    user.firstName = 'Kornelije'
    user.lastName = 'Sajler'

    user.save((err) ->
      if err
        err.should.throw()
        done()
    )

  it 'should not save User without password', (done) ->
    user = new User
    user.email = 'xajler@gmail.com'
    user.password = null
    user.salt = 'U37^$5g%'
    user.firstName = 'Kornelije'
    user.lastName = 'Sajler'

    user.save((err) ->
      if err
        err.should.throw()
        done()
    )

  it 'should not save User without salt', (done) ->
    user = new User
    user.email = 'xajler@gmail.com'
    user.password = 'abc'
    user.salt = null
    user.firstName = 'Kornelije'
    user.lastName = 'Sajler'

    user.save((err) ->
      if err
        err.should.throw()
        done()
    )
    
  it 'should not save User without firstName', (done) ->
    user = new User
    user.email = 'xajler@gmail.com'
    user.password = 'abc'
    user.salt = 'U37^$5g%'
    user.firstName = ''
    user.lastName = 'Sajler'

    user.save((err) ->
      if err
        err.should.throw()
        done()
    )
    
   it 'should not save User without lastName', (done) ->
    user = new User
    user.email = 'xajler@gmail.com'
    user.password = 'abc'
    user.salt = 'U37^$5g%'
    user.firstName = 'Kornelije'
    user.lastName = ''

    user.save((err) ->
      if err
        err.should.throw()
        done()
    )