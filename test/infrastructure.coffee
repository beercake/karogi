stage = require('stage-js')
test 'dependencies', (assert) ->
  assert.ok stage != undefined, 'stage.js found'
  assert.end()

test 'testing', (assert)->
  assert.pass 'is possible'
  assert.end()
