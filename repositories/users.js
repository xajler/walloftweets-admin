(function() {
  var Auth, User, authenticate, createDefaultUser, mongoose, save, users;

  Auth = require('../utils/auth');

  User = require('../models/user');

  mongoose = require('mongoose');

  mongoose.connect('mongodb://localhost/walloftweets');

  User = mongoose.model('User', User);

  authenticate = function(email, password, callback) {
    return User.findOne({
      'email': email
    }, function(err, user) {
      var auth;
      if (err) {
        console.log(err);
      } else {
        console.log(user);
      }
      if (!user) {
        console.log(email + ' ' + password);
        callback(null);
      }
      auth = new Auth();
      if (auth.validate(password, user.salt, user.password)) {
        callback(user);
        return;
      }
      return callback(null);
    });
  };

  save = function(user) {
    console.log(user);
    return user.save(function(err) {
      if (err) {
        throw err;
      } else {
        return console.log('User saved!');
      }
    });
  };

  createDefaultUser = function() {
    var user;
    user = new User;
    user.email = 'xajler@gmail.com';
    user.salt = 'T%6ScZmQ';
    user.password = 'a7caacc44236c74f54571498c33977d3b5f63dec54ae1c095818308607c8302c';
    user.firstName = 'Kornelije';
    user.lastName = 'Sajler';
    return save(user);
  };

  users = {
    'xajler@gmail.com': {
      email: 'xajler@gmail.com',
      salt: 'T%6ScZmQ',
      password: 'a7caacc44236c74f54571498c33977d3b5f63dec54ae1c095818308607c8302c'
    }
  };

  module.exports.authenticate = authenticate;

  module.exports.save = save;

  module.exports.createDefaultUser = createDefaultUser;

}).call(this);
