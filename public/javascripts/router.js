
  define(['jquery', 'underscore', 'backbone', 'views/home/main', 'views/projects/list', 'views/users/list'], function($, _, Backbone, mainHomeView, projectListView, userListView) {
    var AppRouter, initialize;
    AppRouter = Backbone.Router.extend({
      routes: {
        'events': 'showEvents',
        '*actions': 'showEvents'
      },
      showEvents: function() {
        return projectListView.render();
      }
    });
    initialize = function() {
      var app_router;
      app_router = new AppRouter;
      return Backbone.history.start();
    };
    return {
      initialize: initialize
    };
  });
