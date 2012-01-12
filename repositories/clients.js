(function() {
  var Auth, Client, mongoose, save;

  Auth = require('../utils/auth');

  Client = require('../models/client');

  mongoose = require('mongoose');

  save = function(client, next) {
    return client.save(function(err) {
      if (err) {
        return next(false);
      } else {
        return next(true);
      }
    });
  };

  module.exports.save = save;

}).call(this);
