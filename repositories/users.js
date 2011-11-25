var Auth = require('../utils/auth'),
    User = require('../models/user'),
    mongoose = require('mongoose');

mongoose.connect('mongodb://localhost/walloftweets');

var User = mongoose.model('User', User);

var users = {    
  'xajler@gmail.com' : {
    email: 'xajler@gmail.com', 
    salt: 'T%6ScZmQ',
    password: 'a7caacc44236c74f54571498c33977d3b5f63dec54ae1c095818308607c8302c'  }
};

//module.exports.all = users; 

module.exports.authenticate = function(email, password, callback) { 
  
  User.findOne({'email': email}, function(err, user) {
    if (err) {
      console.log(err);
    } else {
      console.log(user);
    }
    if (!user) {     
      console.log(email + ' ' + password);
      callback(null);
    }

    var auth = new Auth();

    if (auth.validate(password, user.salt, user.password)) {
      callback(user);
      return;
    }
    
    callback(null);    
  });
};

module.exports.save = save;

function save(user) {
  console.log(user);
  user.save(function(err) {
    if (!err) {
      console.log('User saved!');
    } else {
      throw err;
    }
  });
}

function createDefaultUser() {
  var user = new User();
  user.email = 'xajler@gmail.com';
  user.salt = 'T%6ScZmQ';
  user.password = 'a7caacc44236c74f54571498c33977d3b5f63dec54ae1c095818308607c8302c';
  user.firstName = 'Kornelije';
  user.lastName = 'Sajler';
  
  save(user);
}

