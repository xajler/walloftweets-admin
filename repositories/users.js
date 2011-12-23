(function() {
  var Auth, User, authenticate, mongoose, save;

  Auth = require('../utils/auth');

  User = require('../models/user');

  mongoose = require('mongoose');

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
    return user.save(function(err) {
      if (err) {
        throw err;
      } else {
        return console.log('User saved!');
      }
    });
  };

  module.exports.authenticate = authenticate;

  module.exports.save = save;

}).call(this);
