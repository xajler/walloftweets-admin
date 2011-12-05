define([
  'jquery',
  'underscore',
  'backbone',
  'views/home/main',
  'views/projects/list',
  'views/users/list'
], ($, _, Backbone, mainHomeView, projectListView, userListView ) ->
  AppRouter = Backbone.Router.extend(
    routes:
      'events': 'showEvents'
      '*actions': 'showEvents'
      
    showEvents: ->
      projectListView.render();
  )

  initialize = ->
    app_router = new AppRouter
    Backbone.history.start()

  initialize: initialize
)