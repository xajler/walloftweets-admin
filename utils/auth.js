(function() {
  var Auth, Sha256, generateSalt, getRandomNumber;

  Sha256 = require('./sha256');

  Auth = function() {
    var create, validate;
    this.salt = null;
    this.hashPassword = null;
    create = function(password) {
      if (!password) throw 'The password should be given';
      this.salt = generateSalt();
      return this.hashPassword = Sha256.hash(this.salt + password);
    };
    validate = function(password, salt, hashPassword) {
      var hashedPassword, result;
      if (!(password || salt || hashPassword)) return false;
      result = false;
      hashedPassword = Sha256.hash(salt + password);
      if (hashPassword === hashedPassword) result = true;
      return result;
    };
    return {
      create: create,
      validate: validate
    };
  };

  generateSalt = function() {
    var length, n, randomNumber, salt, _i, _len;
    length = 8;
    salt = "";
    for (_i = 0, _len = length.length; _i < _len; _i++) {
      n = length[_i];
      randomNumber = getRandomNumber();
      salt += String.fromCharCode(randomNumber);
    }
    return salt;
  };

  getRandomNumber = function() {
    var randomNumber;
    randomNumber = Math.random();
    randomNumber = parseInt(randomNumber * 1000, 10);
    randomNumber = (randomNumber % 94) + 33;
    return randomNumber;
  };

  module.exports = Auth;

}).call(this);
