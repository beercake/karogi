stage = require 'stage-js'
test 'dependencies', (assert) ->
  assert.ok stage != undefined, 'stage.js found'
  assert.end()

test 'testing', (assert) ->
  assert.pass 'is possible'
  assert.end()

test 'sinon spy', (assert) ->
  object = { method: (-> ) }
  mock = spy object, 'method'
  mock.withArgs(42)

  object.method(42)

  assert.ok mock.withArgs(42).calledOnce,
    'kind a works'

  assert.end()
