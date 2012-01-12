(function() {
  var Event, mongoose, save;

  Event = require('../models/event');

  mongoose = require('mongoose');

  save = function(event, next) {
    return event.save(function(err) {
      if (err) {
        return next(false);
      } else {
        return next(true);
      }
    });
  };

  module.exports.save = save;

}).call(this);
