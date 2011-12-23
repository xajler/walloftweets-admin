(function() {
  var Event, Phrases, Schema, Tweeple, Words, mongoose;

  mongoose = require('mongoose');

  Schema = mongoose.Schema;

  Tweeple = new Schema({
    username: {
      type: String,
      required: true
    }
  });

  Words = new Schema({
    name: {
      type: String,
      required: true
    }
  });

  Phrases = new Schema({
    name: {
      type: String,
      required: true
    }
  });

  Event = new Schema({
    name: {
      type: String,
      index: true,
      required: true
    },
    clientId: {
      type: Schema.ObjectId,
      ref: 'Client',
      index: true,
      required: true
    },
    userId: {
      type: Schema.ObjectId,
      ref: 'User',
      index: true,
      required: true
    },
    hashTag: {
      type: String,
      index: true,
      required: true
    },
    downloadInterval: Number,
    tweetsToShow: Number,
    screenRefreshInterval: Number,
    isEnabledForModeration: {
      type: Boolean,
      "default": true
    },
    isEnabledTweetFlow: {
      type: Boolean,
      "default": true
    },
    startDate: Date,
    endDate: Date,
    isActive: {
      type: Boolean,
      "default": true
    },
    isDeleted: {
      type: Boolean,
      "default": false
    },
    fromTweeple: [Tweeple],
    toTweeple: [Tweeple],
    mentionTweeple: [Tweeple],
    containAllOfWords: [Words],
    containAnyOfWords: [Words],
    containExactPhrases: [Phrases],
    whitelistedTweeple: [Tweeple],
    blacklistedTweeple: [Tweeple],
    blacklistedWords: [Words]
  });

  Event.path('name').validate(function(property) {
    return property.length <= 128;
  });

  Event.path('hashTag').validate(function(property) {
    return property.length <= 139;
  });

  Tweeple.path('username').validate(function(property) {
    return property.length <= 15;
  });

  Words.path('name').validate(function(property) {
    return property.length <= 32;
  });

  Phrases.path('name').validate(function(property) {
    return property.length <= 128;
  });

  module.exports = mongoose.model('Event', Event);

}).call(this);
