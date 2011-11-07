var AppRoute = function() { 
    this.requiresLogin = function(req, res, next) {
    if (req.session.user) {
      next();
    } else {
      res.redirect('/login?redir=' + req.url);
    }
  };
};