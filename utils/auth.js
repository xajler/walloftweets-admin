var Sha256 = require('./sha256');

var Auth = function Auth() { 
  this.salt = null;
  this.hashPassword = null; 
  
  function create(password) { 
    if (!password) throw 'The password should be given';
    
    this.salt = generateSalt();
    this.hashPassword = Sha256.hash(this.salt + password);
  }
  
  function validate(password, salt, hashPassword) {
    if (!password || !salt || !hashPassword) return false;
    
    var hashedPassword =  Sha256.hash(salt + password);
    
    if (hashPassword === hashedPassword)
      return true;
      
    return false;
  } 
  
  function generateSalt() {
      var length = 8;
      var salt = "";

      for (i=0; i < length; i++) {
          num = getRandomNum();
          salt += String.fromCharCode(num);
      }

      return salt;
  }
  
  function getRandomNum() {
      // between 0 - 1
      var rndNum = Math.random();

      // rndNum from 0 - 1000
      rndNum = parseInt(rndNum * 1000, 10);

      // rndNum from 33 - 127
      rndNum = (rndNum % 94) + 33;

      return rndNum;
  }
  
  return {             
    create : create,
    validate: validate
  };
};

module.exports = Auth;