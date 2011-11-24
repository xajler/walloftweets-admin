var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var Event = new Schema({
  name: { type: String, index: true, required: true },
  clientId: { type: ObjectId, index: true, required: true },
  userId: { type: ObjectId, index: true, required: true },
  hasTag: { type: String, index: true, required: true },
  downloadInterval: Number,
  tweetsToShow: Number,
  screenRefreshInterval: Number,
  isEnabledForModeration: { type: Boolean, default: true },
  isEnabledTweetFlow: { type: Boolean, default: true },
  startDate: Date,
  endDate: Date,
  isActive: { type: Boolean, default: true },
  isDeleted: { type: Boolean, default: false },
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

var Tweeple = new Schema({
  username: { type: String, required: true }
});

var Words = new Schema({
  name: { type: String, required: true }
});

var Phrases = new Schema({
  name: { type: String, required: true }
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