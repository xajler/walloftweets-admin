var Auth = require('../utils/auth');

var users = {    
  'xajler@gmail.com' : {
    email: 'xajler@gmail.com', 
    salt: 'T%6ScZmQ',
    password: 'a7caacc44236c74f54571498c33977d3b5f63dec54ae1c095818308607c8302c'  }
};

//module.exports.all = users; 

module.exports.authenticate = function(email, password, callback) { 
  if (!users) throw 'Huston we have a problem!';
   
  var user = users[email];

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
};
