#### Requires
# * The MongoDB ODM driver **Mongoose**.
# * **Mongoose** `Schema`.
mongoose = require 'mongoose'
Schema = mongoose.Schema

#### Tweeple
# The new Mongoose `Schema` of Wall Of Tweets Event Tweeple model.
Tweeple = new Schema(
  #### username
  # `String` type, required.
  username:
    type: String 
    required: true
)

#### Words
# The new Mongoose `Schema` of Wall Of Tweets Event Words model.
Words = new Schema(
  #### name
  # `String` type, required.
  name:
    type: String,
    required: true
)

#### Phrases
# The new Mongoose `Schema` of Wall Of Tweets Event Phrases model.
Phrases = new Schema(
  #### name
  # `String` type, required.
  name: 
    type: String
    required: true
)

#### Event
# The new Mongoose `Schema` of Wall Of Tweets Event model.
Event = new Schema(
  #### name
  # `String` type, required, MongoDB index.
  name:
    type: String
    index: true
    required: true
  #### clientId
  # Refernce to `Client` schema model. 
  # `ObjectId` type, required, MongoDB index.
  clientId: 
    type: Schema.ObjectId
    ref: 'Client'
    index: true
    required: true
  #### userId
  # Refernce to `User` schema model. 
  # `ObjectId` type, required, MongoDB index.
  userId:
    type: Schema.ObjectId
    ref: 'User'
    index: true
    required: true
  #### hasTag
  # `Event` Twitter Hash (#) Tag.
  # `String` type, required.
  hashTag:
    type: String
    index: true
    required: true
  #### downloadInterval
  # Interval in which tweets will be downloaded from Twitter API.
  downloadInterval: Number
  #### tweetsToShow
  # The number of tweets shown on the wall.
  tweetsToShow: Number
  #### screenRefreshInterval
  # ??????!!!!!
  screenRefreshInterval: Number
  ##### isEnabledForModeration
  # Does Event need Moderation?
  # `Boolean` type, Set to `true` as default value.
  isEnabledForModeration:
    type: Boolean
    default: true
  ##### isEnabledTweetFlow
  # `Boolean` type, Set to `true` as default value.
  isEnabledTweetFlow:
    type: Boolean
    default: true
  #### startDate
  # Event start date.
  startDate: Date
  #### endDate
  # Event end date.
  endDate: Date
  #### isActive
  # `Boolean` type, Set to `true` as default value.
  isActive:
    type: Boolean
    default: true
  #### isDeleted
  # `Boolean` type, Set to `false` as default value.
  isDeleted:
    type: Boolean
    default: false
  #### fromTweeple
  # Event collection of tweets of from tweeple.
  fromTweeple: [Tweeple],
  #### toTweeple
  # Event collection of tweets of to tweeple.
  toTweeple: [Tweeple],
  #### mentionTweeple
  # Event collection of tweets of mention tweeple.
  mentionTweeple: [Tweeple],
  #### containAllOfWords
  # Event collection of tweets that contains all of the words.
  containAllOfWords: [Words],
  #### containAnyOfWords
  # Event collection of tweets that contains any of the words.
  containAnyOfWords: [Words],
  #### containExactPhrases
  # Event collection of tweets that contains exact phrases.
  containExactPhrases: [Phrases],
  #### whitelistedTweeple
  # Event collection of whitelisted tweeple that are not going into `Moderation`.
  whitelistedTweeple: [Tweeple],
  #### blacklistedTweeple
  # Event collection of blacklisted tweeple.
  blacklistedTweeple: [Tweeple],
  #### blacklistedTweeple
  # Event collection of blacklisted words.
  blacklistedWords: [Words]
)

# Validates that Event `name` is 128 characters long.
Event.path('name').validate (property) ->
  property.length <= 128;

# Validates that Event `hashTag` is 139 characters long.
Event.path('hashTag').validate (property) ->
  property.length <= 139;

# Validates that Tweeple `username` is 15 characters long.
Tweeple.path('username').validate (property) ->
  property.length <= 15;

# Validates that Words `name` is 32 characters long.
Words.path('name').validate (property) ->
  property.length <= 32;

# Validates that Phrases `name` is 128 characters long.
Phrases.path('name').validate (property) ->
  property.length <= 128;

# Exports `Event` Mongoose module as module.
module.exports = mongoose.model('Event', Event)
