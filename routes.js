(function() {
  var eventRoute, getCurrentUserFullName, requiresLogin;

  requiresLogin = function(req, res, next) {
    if (req.session.user) {
      return next();
    } else {
      return res.redirect('/login?redir=' + req.url);
    }
  };

  getCurrentUserFullName = function(req, res) {
    if (req.session.user !== null) {
      return req.session.user.firstName + ' ' + req.session.user.lastName;
    } else {
      return res.redirect('/login?redir=' + req.url);
    }
  };

  eventRoute = function(app) {
    return app.get('/events', requiresLogin, function(req, res) {
      return res.render('index', {
        title: 'Events',
        currentUserFullName: getCurrentUserFullName(req, res)
      });
    });
  };

  module.exports = eventRoute;

}).call(this);
