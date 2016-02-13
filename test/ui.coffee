root.Image = -> true

root.window =
  addEventListener: -> true

root.Stage = require 'stage-js/platform/web'

test 'ui', (assert) ->
  mock = spy Stage, 'image'

  require('./app/ui.js').ui()

  # TODO: figure out how to effectively test stage.js

  #assert.ok mock.called,
  #  'image called'

  #jQuery.ajax.getCall(0).args[0].url

  assert.end()
