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
save = (client) ->
  client.save (err) ->
    if err then throw err else console.log 'Client saved!'

# Exports `save` as module.
module.exports.save = save