#!/bin/bash

(coffee --compile --watch .&)
nodemon app.js

#mongod --dbpath /usr/local/var/mongodb
