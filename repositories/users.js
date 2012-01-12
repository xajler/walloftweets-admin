(function() {
  var Auth, User, authenticate, findByEmail, mongoose, save;

  Auth = require('../utils/auth');

  User = require('../models/user');

  mongoose = require('mongoose');

  findByEmail = function(email, next) {
    return User.where('email', email).findOne(function(err, user) {
      if (user) {
        return next(user);
      } else {
        return next(null);
      }
    });
  };

  authenticate = function(email, password, next) {
    return this.findByEmail(email, function(user) {
      var auth;
      if (user) {
        auth = new Auth();
        if (auth.validate(password, user.salt, user.password)) return next(user);
      }
      return next(null);
    });
  };

  save = function(user, next) {
    return user.save(function(err) {
      if (err) {
        return next(false);
      } else {
        return next(true);
      }
    });
  };

  module.exports.findByEmail = findByEmail;

  module.exports.authenticate = authenticate;

  module.exports.save = save;

}).call(this);
