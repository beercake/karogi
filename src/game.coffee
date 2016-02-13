root = window || root

root.Stage = require 'stage-js/platform/web'

ui = require('./ui.js').ui

ui()
