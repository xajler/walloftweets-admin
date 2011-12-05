(function() {
  var app, express, users;

  express = require('express');

  require('express-resource');

  app = module.exports = express.createServer();

  users = require('./repositories/users');

  app.configure(function() {
    app.use(express.logger('dev'));
    app.set('views', __dirname + '/views');
    app.use(express.bodyParser());
    app.use(express.cookieParser());
    app.use(express.session({
      secret: '~oTU2C"!XI=ZS?^}'
    }));
    app.use(express.methodOverride());
    app.set('view engine', 'jade');
    app.use(app.router);
    return app.use(express.static(__dirname + '/public'));
  });

  app.configure('development', function() {
    return app.use(express.errorHandler({
      dumpExceptions: true,
      showStack: true
    }));
  });

  app.configure('production', function() {
    return app.use(express.errorHandler());
  });

  require('./routes')(app);

  app.get('/', function(req, res) {
    if (req.session.user) {
      return res.redirect('/events');
    } else {
      return res.redirect('/login?redir=' + req.url);
    }
  });

  app.get('/login', function(req, res) {
    console.log('going to events');
    return res.render('login', {
      title: 'Login',
      layout: '',
      locals: {
        redir: req.query.redir
      }
    });
  });

  app.post('/login', function(req, res) {
    return users.authenticate(req.body.email, req.body.password, function(user) {
      if (user) {
        req.session.user = user;
        return res.redirect(req.body.redir || '/events');
      } else {
        return res.render('login', {
          title: 'Login',
          layout: '',
          locals: {
            redir: req.query.redir
          }
        });
      }
    });
  });

  app.get('/logout', function(req, res) {
    delete req.session.user;
    return res.redirect('/login');
  });

  app.listen(3000);

  console.log('Express server listening on port %d in %s mode', app.address().port, app.settings.env);

}).call(this);
