root.screen =
  availWidth: 1
  availHeight: 1
root.chrome =
  app:
    window:
      create: (view, options) ->
        chrome.app.view = view
        chrome.app.options = options
    runtime:
      onLaunched:
        addListener: (callback) ->
          chrome.app.initialized = true
          callback()

test 'background', (assert) ->
  imports 'app/background.js'

  assert.ok chrome.app.initialized,
    'inits chrome app'

  assert.ok chrome.app.view == 'index.html',
    'feeds in index.html view'

  assert.ok chrome.app.options['id'] == 'karogi',
    "sets id as 'karogi'"

  # https://developer.chrome.com/apps/app_window#type-Bounds
  outerBounds = chrome.app.options['outerBounds']

  assert.ok outerBounds['width'] == 500,
    'sets width to 500'

  assert.ok outerBounds['height'] == 300,
    'sets height to 300'

  assert.ok outerBounds['left'] == -249,
    'sets current X coordinate to -249'

  assert.ok outerBounds['left'] == -249,
    'sets current Y coordinate to -149'

  assert.end()
