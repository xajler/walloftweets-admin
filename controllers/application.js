(function() {
  var AppRoute;

  AppRoute = function() {
    this.requiresLogin = function(req, res, next) {};
    if (req.session.user) {
      return next();
    } else {
      return res.redirect('/login?redir=' + req.url);
    }
  };

}).call(this);
