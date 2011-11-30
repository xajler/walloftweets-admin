(function() {
  var requiresLogin;

  requiresLogin = function(req, res, next) {
    if (req.session.user) {
      return next();
    } else {
      return res.redirect('/login?redir=' + req.url);
    }
  };

  module.exports = function(app) {
    return app.get('/events', requiresLogin, function(req, res) {
      return res.render('index', {
        title: 'Events'
      });
    });
  };

}).call(this);
