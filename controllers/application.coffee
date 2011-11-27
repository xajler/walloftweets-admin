AppRoute = ->
    @requiresLogin = (req, res, next) ->
    if req.session.user then next() else res.redirect('/login?redir=' + req.url)