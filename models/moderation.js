(function() {
  var Moderation, Schema, mongoose;

  mongoose = require('mongoose');

  Schema = mongoose.Schema;

  Moderation = new Schema({
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
    }
  });

  Modertion.path('tweetId').validate(function(property) {
    return property.length <= 32;
  });

  Modertion.path('tweetUsername').validate(function(property) {
    return property.length <= 15;
  });

  Modertion.path('tweetText').validate(function(property) {
    return property.length <= 140;
  });

  Modertion.path('tweetAvatarUri').validate(function(property) {
    return property.length <= 512;
  });

}).call(this);
