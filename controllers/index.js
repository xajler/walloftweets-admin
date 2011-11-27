
  exports.index = function(req, res) {
    appRoute.requiresLogin();
    return res.render('index', {
      title: 'Express'
    });
  };

  exports.login = function(req, res) {
    return res.render('login', {
      title: 'Login'
    });
  };
