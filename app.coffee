#### Requires
#
# * The [Express.js](http://expressjs.com).
# * The [_express-resource_](https://github.com/visionmedia/express-resource) - Express.js Resourceful routing.
# * Initialization of WallOfTweets MongoDB via Mongoose.
# * The users repository for authentication found in [`/repositories/users.coffee`](users.html)
express = require 'express'
require 'express-resource'
mongooseInit = require './mongoose-init'
users = require './repositories/users' 

# Creation of server and `app` and export.
app = module.exports = express.createServer()   

# Connecting to the WallOfTweets MongoDB database.
mongooseInit.connect();

#### Express Configuration
# * Cookie parser.
# * Session secret.
# * View Engine [Jade](https://github.com/visionmedia/jade).
# * Views are se to be in `views` folder.
# * Static files will be served from `public` folder.
app.configure ->
  app.use express.logger 'dev'
  app.set 'views', __dirname + '/views'
  app.use express.bodyParser()
  app.use express.cookieParser()
  app.use express.session({ secret: '~oTU2C"!XI=ZS?^}' })
  app.use express.methodOverride()
  app.set 'view engine', 'jade'
  app.use app.router
  app.use express.static(__dirname + '/public')

#### Development Configuration
# * dumps the exceptions. 
# * shows stack trace. 
app.configure 'development', ->
  app.use express.errorHandler({ dumpExceptions: true, showStack: true })

# Production Configuration
app.configure 'production', ->
  app.use express.errorHandler()

#### Routes
# The UI routes for Wall Of Tweets admin application.
require('./routes')(app)

# Index or Home route resource.
# If user is signed in it will redirect to **Events** otherwise
# the user will be redirected to **Login** page.
app.get '/', (req, res) -> 
  if req.session.user then res.redirect('/events') else res.redirect('/login?redir=' + req.url) 

# The **Login** get route resource diplays the login page `views/login.jade`.
app.get '/login', (req, res) -> 
  res.render 'login'
    title: 'Login'
    layout : ''
    locals: 
      redir: req.query.redir  

# The **Login** post route resource authenticates the validity of user input 
# and if it is correct redirects him to **Events*** page or redirects the user again 
# to login page `views/login.jade`.
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
# The **Logout*** resource route destroys the user session and log out the user from application.
app.get '/logout', (req, res) ->
  delete req.session.user
  res.redirect '/login' 

app.listen 3000
console.log 'Express server listening on port %d in %s mode', app.address().port, app.settings.env;