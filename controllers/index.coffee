# appRoute = require './app-route'

exports.index = (req, res) ->
  appRoute.requiresLogin()
  res.render 'index', { title: 'Express' }

exports.login = (req, res) ->
  res.render 'login', { title: 'Login' }