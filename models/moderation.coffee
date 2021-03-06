#### Requires
# * The MongoDB ODM driver **Mongoose**.
# * **Mongoose** `Schema`.
mongoose = require 'mongoose'
Schema   = mongoose.Schema

#### Moderation 
# The new Mongoose `Schema` of Wall Of Tweets Moderation model.
Moderation = new Schema(
  #### eventId
  # Refernce to `Event` schema model.
  # `ObjectId` type, required, MongoDB index.
  eventId:
    type: ObjectId
    index: true
    required: true
  #### tweetId
  # Id givene from Twitter. 
  # `String` type, required.
  tweetId:
    type: String
    required: true
  #### tweepUsername
  # Username of Twitter user (_Tweep_). 
  # `String` type, required.
  tweepUsername:
    type: String
    required: true
  #### tweetText
  # Actual tweet text going into Moderation (Bucket). 
  # `String` type, required.
  tweetText:
    type: String
    required: true
  #### tweepAvatarUri
  # Twitter user (_Tweep_) image (avatar) `URI`. 
  # `String` type, required.
  tweepAvatarUri: 
    type: String
    required: true
  #### date
  # Date when tweet entered Moderation or Date of actual tweet. 
  # `Date` type, default value is current actual date.
  date:
    type: Date
    default: Date.now
)

# Validates that Moderation `tweetId` is 32 characters long.
ModertionBucket.path('tweetId').validate (property) ->
  property.length <= 32

# Validates that Moderation `tweetUsername` is 15 characters long.
ModertionBucket.path('tweetUsername').validate (property) ->
  property.length <= 15

# Validates that Moderation `tweetText` is 140 characters long.
ModertionBucket.path('tweetText').validate (property) ->
  property.length <= 140

# Validates that Moderation `tweetAvatarUri` is 512 characters long.
ModertionBucket.path('tweetAvatarUri').validate (property) ->
  property.length <= 512

# Exports `Moderation` Mongoose module as module.
module.exports = mongoose.model('Moderation', Moderation)