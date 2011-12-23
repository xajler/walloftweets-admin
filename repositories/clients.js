(function() {
  var Auth, Client, mongoose, save;

  Auth = require('../utils/auth');

  Client = require('../models/client');

  mongoose = require('mongoose');

  save = function(client) {
    return client.save(function(err) {
      if (err) {
        throw err;
      } else {
        return console.log('Client saved!');
      }
    });
  };

  module.exports.save = save;

}).call(this);
