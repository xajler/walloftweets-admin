#### Requires
# * The MongoDB ODM driver **Mongoose**.
mongoose = require 'mongoose'

#### init
# MongoDb database connection provider. 
# If application is not connected to  it creates new
init = do ->
  connected = false                    
  
  #### connect
  # Connecttion to to MongoDb database with given conncetion sctring 
  # or default _mongodb://localhost/walloftweets_.
  connect: (connectionString) ->
    if (!connected) 
      connectionString = connectionString || 'mongodb://localhost/walloftweets'
      mongoose.connect(connectionString)
      connected = true;

# Exports `init` as module.
module.exports = init