(function() {
  var mongoose;

  mongoose = require('mongoose');

  module.exports = (function() {
    var connected;
    connected = false;
    return {
      connect: function(connectionString) {
        if (!connected) {
          connectionString = connectionString || 'mongodb://localhost/walloftweets';
          mongoose.connect(connectionString);
          return connected = true;
        }
      }
    };
  })();

}).call(this);
