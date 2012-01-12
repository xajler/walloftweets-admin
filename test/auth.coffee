Auth = require '../utils/auth'
should = require 'should'

describe 'Auth:', ->
  it 'should be instance of Object', ->
    auth = new Auth
    auth.should.be.an.instanceof Object

  it 'should create salt and hashed password', ->
    auth = new Auth
    auth.create 'abc'
    should.exist auth.salt
    should.exist auth.hashPassword  

  it 'should throw error on create if the password is not given', ->
    auth = new Auth
    err = -> auth.create();
    err.should.throw()

  it 'should validate salt and password with hashed password', ->
    auth = new Auth
    salt = 'd=-*TQ2='
    hashPassword = '8af891cfa0e7e0e42c199dcba705545dcbe301613a39ab854244d644c7685c6a'
    result = auth.validate('abc', salt, hashPassword)
    result.should.be.true;

  it 'should not be valid if there is no password', ->
    auth = new Auth
    salt = 'd=-*TQ2='
    hashPassword = '8af891cfa0e7e0e42c199dcba705545dcbe301613a39ab854244d644c7685c6a'
    result1 = auth.validate('', salt, hashPassword)
    result2 = auth.validate(null, salt, hashPassword)
    result3 = auth.validate(undefined, salt, hashPassword)

    result1.should.be.false
    result2.should.be.false
    result3.should.be.false

  it 'should not be valid if there is no salt', ->
    auth = new Auth
    salt1 = ''
    salt2 = null
    salt3 = undefined
    hashPassword = '8af891cfa0e7e0e42c199dcba705545dcbe301613a39ab854244d644c7685c6a'
    result1 = auth.validate('abc', salt1, hashPassword)
    result2 = auth.validate('abc', salt2, hashPassword)
    result3 = auth.validate('abc', salt3, hashPassword)

    result1.should.be.false
    result2.should.be.false
    result3.should.be.false  

  it 'should not be valid if there is no hash password', ->
    auth = new Auth
    salt = 'd=-*TQ2='
    hashPassword1 = ''
    hashPassword2 = null
    hashPassword3 = undefined
    result1 = auth.validate('abc', salt, hashPassword1)
    result2 = auth.validate('abc', salt, hashPassword2)
    result3 = auth.validate('abc', salt, hashPassword3)

    result1.should.be.false
    result2.should.be.false
    result3.should.be.false

  it 'should not be valid if there is no password or salt or hash password', ->
    auth = new Auth
    salt = 'd=-*TQ2='
    hashPassword = '8af891cfa0e7e0e42c199dcba705545dcbe301613a39ab854244d644c7685c6a'
    result1 = auth.validate(null, null, null)
    result2 = auth.validate('abc', null, hashPassword)
    result3 = auth.validate('abc', null, null)
    result4 = auth.validate('abc', salt, null)

    result1.should.be.false
    result2.should.be.false
    result3.should.be.false
    result4.should.be.false
