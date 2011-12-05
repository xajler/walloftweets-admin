requiresLogin = (req, res, next) ->
    if req.session.user then next() else res.redirect('/login?redir=' + req.url)

getCurrentUserFullName = (req, res) ->
  if (req.session.user != null)
    req.session.user.firstName + ' ' + req.session.user.lastName
  else
    res.redirect('/login?redir=' + req.url) 

module.exports = (app) ->
  # app.all '(/*)?', requiresLogin 

  app.get '/events', requiresLogin, (req, res) ->
    res.render 'index', { title: 'Events', currentUserFullName: getCurrentUserFullName(req, res) }