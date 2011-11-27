#!/bin/bash

(coffee --compile --watch .&)
nodemon app.js
