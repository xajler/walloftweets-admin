#### requiresLogin
# Checks whether the session user is existing, if not redirects to login page.
requiresLogin = (req, res, next) ->
    if req.session.user then next() else res.redirect('/login?redir=' + req.url)

#### getCurrentUserFullName
# Gets the user first and last name from session user, if in session isn't user redirects
# to login page.
getCurrentUserFullName = (req, res) ->
  if (req.session.user != null)
    req.session.user.firstName + ' ' + req.session.user.lastName
  else
    res.redirect('/login?redir=' + req.url) 

#### Events Route
# When /events is requested returns index page and sets title and logged in user full name.
eventRoute = (app) ->
  # app.all '(/*)?', requiresLogin 

  app.get '/events', requiresLogin, (req, res) ->
    res.render 'index', { title: 'Events', currentUserFullName: getCurrentUserFullName(req, res) }

# Exports `eventRoute` as module.
module.exports = eventRoute;