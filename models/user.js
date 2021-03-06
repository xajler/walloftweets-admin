(function() {
  var Schema, User, mongoose;

  mongoose = require('mongoose');

  Schema = mongoose.Schema;

  User = new Schema({
    email: {
      type: String,
      required: true,
      unique: true,
      validate: /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
    },
    password: {
      type: String,
      required: true
    },
    salt: {
      type: String,
      required: true
    },
    firstName: {
      type: String,
      index: true,
      required: true
    },
    lastName: {
      type: String,
      index: true,
      required: true
    },
    role: {
      type: String,
      "enum": ['Administrator', 'Event Administrator'],
      "default": 'Event Administrator'
    },
    isActive: {
      type: Boolean,
      "default": true
    },
    isDeleted: {
      type: Boolean,
      "default": false
    }
  });

  User.virtual('fullName').get(function() {
    return this.firstName + " " + this.lastName;
  });

  User.path('email').validate(function(property) {
    return property.length <= 64;
  });

  User.path('firstName').validate(function(property) {
    return property.length <= 32;
  });

  User.path('lastName').validate(function(property) {
    return property.length <= 64;
  });

  module.exports = mongoose.model('User', User);

}).call(this);
