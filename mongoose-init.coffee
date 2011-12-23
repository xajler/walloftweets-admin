#### Requires
# * The MongoDB ODM driver **Mongoose**.
mongoose = require 'mongoose'

#### Exports Monngoose init as module
# MongoDb database connection provider. 
# If application is not connected to  it creates new
module.exports = do ->
  connected = false                    
  
  #### connect
  # Connecttion to to MongoDb database with given conncetion sctring 
  # or default _mongodb://localhost/walloftweets_.
  connect: (connectionString) ->
    if (!connected) 
      connectionString = connectionString || 'mongodb://localhost/walloftweets'
      mongoose.connect(connectionString)
      connected = true;