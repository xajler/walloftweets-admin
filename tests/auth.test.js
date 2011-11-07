var Auth = require('../utils/auth'),
    assert = require('assert'),
    should = require('should');

function err(fn, msg) {
  try {
    fn();
    should.fail('expected an error');
  } catch (error) {
    should.equal(msg, error.message);
  }
} 

module.exports = { 
  'test valid instance': function() {
    var auth = new Auth();   
    
    auth.should.be.an.instanceof(Object);
  },
  
  'test valid auth creation of salt and hashed password': function() {
    var auth = new Auth();
    auth.create('abc');
    
    should.exist(auth.salt);
    should.exist(auth.hashPassword);                  
  },
  
  'test auth creation throws error when password is not given': function() {
    var auth = new Auth();      

    err(function() {
      auth.create();
    }, undefined);
  },
  
  'test valid auth validation of salt and password with hashed password': function() {
    var auth = new Auth();  
    var salt = 'd=-*TQ2='; 
    var hashPassword = '8af891cfa0e7e0e42c199dcba705545dcbe301613a39ab854244d644c7685c6a'; 
    var result = auth.validate('abc', salt, hashPassword);
      
    result.should.be.true;
  }, 
  
  'test invalid auth validation: no password': function() {
    var auth = new Auth();  
    var salt = 'd=-*TQ2='; 
    var hashPassword = '8af891cfa0e7e0e42c199dcba705545dcbe301613a39ab854244d644c7685c6a'; 
    var result1 = auth.validate('', salt, hashPassword);
    var result2 = auth.validate(null, salt, hashPassword);
    var result3 = auth.validate(undefined, salt, hashPassword);
      
    result1.should.be.false;
    result2.should.be.false;
    result3.should.be.false;
  },    
  
  'test invalid auth validation: no salt': function() {
    var auth = new Auth();  
    var salt1 = ''; 
    var salt2 = null; 
    var salt3 = undefined; 
    var hashPassword = '8af891cfa0e7e0e42c199dcba705545dcbe301613a39ab854244d644c7685c6a'; 
    var result1 = auth.validate('abc', salt1, hashPassword);
    var result2 = auth.validate('abc', salt2, hashPassword);
    var result3 = auth.validate('abc', salt3, hashPassword);
      
    result1.should.be.false;
    result2.should.be.false;
    result3.should.be.false;
  }, 
  
  'test invalid auth validation: no hashPassword': function() {
    var auth = new Auth();  
    var salt = 'd=-*TQ2='; 
    var hashPassword1 = ''; 
    var hashPassword2 = null; 
    var hashPassword3 = undefined; 
    var result1 = auth.validate('abc', salt, hashPassword1);
    var result2 = auth.validate('abc', salt, hashPassword2);
    var result3 = auth.validate('abc', salt, hashPassword3);
      
    result1.should.be.false;
    result2.should.be.false;
    result3.should.be.false;
  }, 
  
  'test invalid auth validation: no password or salt or hashsPassword': function() {
    var auth = new Auth();  
    var salt = 'd=-*TQ2='; 
    var hashPassword = '8af891cfa0e7e0e42c199dcba705545dcbe301613a39ab854244d644c7685c6a';  
    var result1 = auth.validate(null, null, null);
    var result2 = auth.validate('abc', null, hashPassword);
    var result3 = auth.validate('abc', null, null);
    var result4 = auth.validate('abc', salt, null); 
      
    result1.should.be.false;
    result2.should.be.false;
    result3.should.be.false;
    result4.should.be.false;
  },
};
