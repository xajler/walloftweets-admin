//var appRoute = require('./app-route');

exports.index = function(req, res){       
  appRoute.requiresLogin();
  res.render('index', { title: 'Express' });
}; 

exports.login = function(req, res){
  res.render('login', { title: 'Login' });
};