#### Requires
#
# * The Mongoose model of `Event`.
# * The MongoDB ODM driver **Mongoose**.
Event = require '../models/event'
mongoose = require 'mongoose' 

#### save
# Saves the given event to the MongoDB client collection.
# Returns the boolen when is done as next callback.
save = (event, next) ->
  event.save (err) ->
    if err then next no else next yes

# Exports `save` as module.
module.exports.save = save