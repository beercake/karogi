root.chrome =
  app:
    runtime:
      onLaunched:
        addListener: (callback) ->
          chrome.app.initialized = true

test 'karogi', (assert) ->
  imports 'build/karogi.js'

  assert.ok chrome.app.initialized, 'inits chrome app'

  assert.end()
