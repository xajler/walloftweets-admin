var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var User = new Schema({
  email: {
    type: String,
    required: true,
    index: { unique: true }, validate: /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
  },
  password: { type: String, index: true, required: true },
  salt: String,
  firstName: { type: String, index: true, required: true },
  lastName: { type: String, index: true, required: true },
  role: {
    type: String,
    enum: ['Administrator', 'Event Administrator'],
    default: 'Event Administrator'
  },
  isActive: { type: Boolean, default: true },
  isDeleted: { type: Boolean, default: false }
});

User.virtual('fullName').get(function(){
  return this.firstName + this.lastName;
});

User.path('email').validate(function(property) {
  return property.length > 128;
});

User.path('firstName').validate(function(property) {
  return property.length > 32;
});

User.path('lastName').validate(function(property) {
  return property.length > 64;
});