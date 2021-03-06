(function() {
  var Language, Schema, mongoose;

  mongoose = require('mongoose');

  Schema = mongoose.Schema;

  Language = new Schema({
    name: String,
    nativeName: String,
    cultureCode: String,
    position: Number
  });

  Language.path('name').validate(function(property) {
    return property.length <= 32;
  });

  Language.path('nativeName').validate(function(property) {
    return property.length <= 32;
  });

  Language.path('cultureCode').validate(function(property) {
    return property.length <= 7;
  });

  module.exports = mongoose.model('Language', Language);

}).call(this);
