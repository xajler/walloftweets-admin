(function() {
  var Client, Schema, mongoose;

  mongoose = require('mongoose');

  Schema = mongoose.Schema;

  Client = new Schema({
    name: {
      type: String,
      index: true,
      required: true
    },
    email: {
      type: String,
      required: true,
      index: {
        unique: true
      },
      validate: /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
    },
    contactPersonName: String,
    address: String,
    country: String,
    telephone: String,
    mobile: String,
    isActive: {
      type: Boolean,
      "default": true
    },
    isDeleted: {
      type: Boolean,
      "default": false
    },
    isUserWhitelistedForAllEvents: {
      type: Boolean,
      "default": false
    },
    isUserBlacklistedForAllEvents: {
      type: Boolean,
      "default": false
    },
    isWordBlacklistedForAllEvents: {
      type: Boolean,
      "default": false
    }
  });

  Client.path('name').validate(function(property) {
    return property.length <= 64;
  });

  Client.path('email').validate(function(property) {
    return property.length <= 128;
  });

}).call(this);
