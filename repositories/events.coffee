#### Requires
#
# * The Mongoose model of `Event`.
# * The MongoDB ODM driver **Mongoose**.
Event = require '../models/event'
mongoose = require 'mongoose' 

#### Save
# Saves the given event to the MongoDB client collection.
save = (event) ->
  event.save (err) ->
    if err then throw err else console.log 'Event saved!'

# Exports `save` as module.
module.exports.save = save