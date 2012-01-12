#### Requires
#
# * `auth` helper utility for salting and hashing password.
# * The Mongoose model of `Client`.
# * The MongoDB ODM driver **Mongoose**.
Auth = require '../utils/auth'
Client = require '../models/client'
mongoose = require 'mongoose' 

#### Save
# Saves the given client to the MongoDB client collection.
# Returns the boolen when is done as next callback.
save = (client, next) ->
  client.save (err) ->
    if err then next no else next yes

# Exports `save` as module.
module.exports.save = save