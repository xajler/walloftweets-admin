(function() {
  var ModerationBucket, Schema, mongoose;

  mongoose = require('mongoose');

  Schema = mongoose.Schema;

  ModerationBucket = new Schema({
    eventId: {
      type: ObjectId,
      index: true,
      required: true
    },
    tweetId: {
      type: String,
      required: true
    },
    tweepUsername: {
      type: String,
      required: true
    },
    tweetText: {
      type: String,
      required: true
    },
    tweepAvatarUri: {
      type: String,
      required: true
    },
    date: {
      type: Date,
      "default": Date.now
    },
    dateApproved: Date,
    sentTimestamp: Date
  });

  ModertionBucket.path('tweetId').validate(function(property) {
    return property.length <= 32;
  });

  ModertionBucket.path('tweetUsername').validate(function(property) {
    return property.length <= 15;
  });

  ModertionBucket.path('tweetText').validate(function(property) {
    return property.length <= 140;
  });

  ModertionBucket.path('tweetAvatarUri').validate(function(property) {
    return property.length <= 512;
  });

}).call(this);
