(function() {
  var Event, mongoose, save;

  Event = require('../models/event');

  mongoose = require('mongoose');

  save = function(event) {
    return event.save(function(err) {
      if (err) {
        throw err;
      } else {
        return console.log('Event saved!');
      }
    });
  };

  module.exports.save = save;

}).call(this);
