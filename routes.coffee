requiresLogin = (req, res, next) ->
    if req.session.user then next() else res.redirect('/login?redir=' + req.url)

module.exports = (app) ->
  # app.all '(/*)?', requiresLogin
  
  app.get '/events', requiresLogin, (req, res) ->
    res.render 'index', { title: 'Events' }