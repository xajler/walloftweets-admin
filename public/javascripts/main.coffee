require.config(
  paths:
    jquery: 'lib/jquery/jquery-min'
    underscore: 'lib/underscore/underscore-min'
    backbone: 'lib/backbone/backbone-optamd3-min'
    text: 'lib/require/text'
    templates: '../templates'
)

require(['app'], (App) ->
  App.initialize()
)
