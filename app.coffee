express = require 'express'
require 'express-resource'

app = module.exports = express.createServer()
users = require './repositories/users'

# Configuration
app.configure ->
  app.use express.logger 'dev'
  app.set 'views', __dirname + '/views'
  app.use express.bodyParser()
  app.use express.cookieParser()
  app.use express.session({ secret: '~oTU2C"!XI=ZS?^}' })
  app.use express.methodOverride()
  app.set 'view engine', 'jade'
  #app.use require('stylus').middleware({ src: __dirname + '/public' })
  app.use app.router
  # app.use messages()
  app.use express.static(__dirname + '/public')

app.configure 'development', ->
  app.use express.errorHandler({ dumpExceptions: true, showStack: true })

app.configure 'production', ->
  app.use express.errorHandler() 

# Routes
require('./routes')(app)  

app.get '/', (req, res) ->  
  if req.session.user then res.redirect('/events') else res.redirect('/login?redir=' + req.url) 

app.get '/login', (req, res) -> 
  console.log('going to events')
  res.render 'login'
    title: 'Login'
    layout : ''
    locals: 
      redir: req.query.redir

app.post '/login', (req, res) ->
  users.authenticate req.body.email, req.body.password, (user) ->
    if user
      req.session.user = user
      res.redirect(req.body.redir || '/events')
    else
      res.render 'login'
        title: 'Login'
        layout : ''
        locals:
          redir: req.query.redir

app.get '/logout', (req, res) ->
  delete req.session.user
  res.redirect '/login' 

app.listen 3000
console.log 'Express server listening on port %d in %s mode', app.address().port, app.settings.env;