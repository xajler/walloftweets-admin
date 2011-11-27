mongoose = require 'mongoose'
Schema   = mongoose.Schema
    
ModerationBucket = new Schema(
  eventId:
    type: ObjectId
    index: true
    required: true
  tweetId:
    type: String
    required: true
  tweepUsername:
    type: String
    required: true
  tweetText:
    type: String
    required: true
  tweepAvatarUri: 
    type: String
    required: true
  date:
    type: Date
    default: Date.now
  dateApproved: Date
  sentTimestamp: Date
)

ModertionBucket.path('tweetId').validate (property) ->
  property.length <= 32

ModertionBucket.path('tweetUsername').validate (property) ->
  property.length <= 15

ModertionBucket.path('tweetText').validate (property) ->
  property.length <= 140

ModertionBucket.path('tweetAvatarUri').validate (property) ->
  property.length <= 512