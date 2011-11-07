var express = require('express');
require('express-resource');

var app = module.exports = express.createServer();  
var users = require('./repositories/users');

// Configuration
app.configure(function(){      
  app.use(express.logger('dev'));
  app.set('views', __dirname + '/views');
  app.use(express.bodyParser()); 
  app.use(express.cookieParser()); 
  app.use(express.session({ secret: '~oTU2C"!XI=ZS?^}' }));
  app.use(express.methodOverride());
  app.set('view engine', 'jade');
  app.use(require('stylus').middleware({ src: __dirname + '/public' }));
  app.use(app.router);  
  //app.use(messages());
  app.use(express.static(__dirname + '/public'));
});

app.configure('development', function() {
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true })); 
});

app.configure('production', function() {
  app.use(express.errorHandler()); 
}); 

function requiresLogin(req, res, next) {
  if (req.session.user) {
    next();
  } else {
    res.redirect('/login?redir=' + req.url);
  }
}

// Routes
app.get('/', requiresLogin, function(req, res) {
  res.render('index', { title: 'Express' }); 
}); 

app.get('/login', function(req, res) {
  res.render('login', {    
    title: 'Login',
    locals: {
    redir: req.query.redir }
  });
}); 

app.post('/login', function(req, res) {
  users.authenticate(req.body.email, req.body.password, function(user) {
    if (user) {
      req.session.user = user;
      res.redirect(req.body.redir || '/');
    } else {
      res.render('login', {    
        title: 'Login',
        locals: {
        redir: req.query.redir }
      });
    }
  });
});

app.listen(3000);
console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);