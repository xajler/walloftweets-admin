#!/bin/bash

(coffee -cw models/ repositories/ app.coffee routes.coffee mongoose-init.coffee fake-data.coffee &)
nodemon app.coffee

# mongod --dbpath /usr/local/var/mongodb
# git commit -F msg.md 
# docco-husky -name "Wall Of Tweets" app.coffee mongoose-init.coffee utils/auth.coffee repositories/users.coffee models/*.coffee
# sed -i.bak 's/"version": "0.0.1"/"version": "0.0.2"/g' package.json; rm *.bak
