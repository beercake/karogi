# Header file for tests

root.test = require('tape').test
root.spy = require('sinon').spy

# load node-import without wrapping to variable. 
require 'node-import'
