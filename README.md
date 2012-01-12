# Release Notes

## v0.0.4

* Created all authentication tests for _User Model_, _Auth_ and _User Repositories_
* Updated and created new docs
* Updated models and repositories the save now has callback and User has findByEmail

## v0.0.3 

* Fixed issue with _mongoose-int_.
* Created _fake-data_ generator of fake data for now one user, client and two events for this user/client.
* Models now _exports_ *Mongoose* _model_ instead of _Schema_ and creating _model_ in _repositories_.
* For _user_ and _client_ model now is used *Mongoose* shorthand for unique index "_unique: true_".
* From _event_ model removed exports for _tweeple_, _words_ and _phrase_.
* In _event_ model changed references to _user_ and _client_ with *Mongoose*  _type_ + _ref_.
* Created in _repositories_ _events_ with only one exported module function _save_.
* Fake functions from _repositories_ folder for _users_, _clients_, _events_ moved to _fake-data_.
* Changed _start.sh_ to include _fake-data_ in _CoffeScript_ watch and compile.

## v0.0.2 Added Docco Documentation and Mocha Testing

* A Docco-Huskey Documentation for all serverside *.coffee files except test.
* Documentation is in _doc_ folder.
* Test folder renamed from "_tests_" to "_test_".
* [_Mocha_](http://visionmedia.github.com/mocha/) is used for _BDD_ testing with [_should.js_](https://github.com/visionmedia/should.js).
* _auth.test.js_ is converted from _Expresso_ to _Mocha_.
* "_auth.test.js_" is converted to _CoffeeScript_ and renamed simply to _auth.coffee_.
* Since the _Mocha_ supports _CoffeeScript_ there is no _auth.js_ in test.
* Created _Makefile_ for _Mocha_ test settings and test are invoked with command _make test_.
* Mostly all of models didn't have export of themselves so it is fixed now.
* Added _mongoose-init_, a singleton called in _App_ that connects to _MongoDB_, so there is no more need for connecting each time the _MongoDB_ when connection is needed.
* _Package.json_ updated with updated dependencies.
* Application now uses _Node_ _v0.6.6_.
* There is _msg.md_ for git commit messages invoked with command "_git commit -F msg.md_".
* _msg.md_ is put in _.gitignore_ there is no need for this message to be part of source control.
* Added README.md to contain _Relese Notes_ of relevant commit messages.

## v0.0.1 Major changes and UI Improvements

* Added images and stylesheet for login and general UI.
* Used _Require.js_ for JavaScript dependencies.
* Used Backbone.js with _Underscore.js_ with _Require.js_.
* _layout.jade_ is having a user full name link with logout link.
* Added menu navigation with "_Events_", "_Moderation_", "_Phrases_", "_Tweeple_", for now hardcoded, and only "_/events_" route is functional right now.
* There are some JavaScripts not converted to _CoffeScript_ but mayor are.